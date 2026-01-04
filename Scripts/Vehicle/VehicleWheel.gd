class_name Wheel
extends RayCast3D

@export_group("Wheel Visual")
## [b][img width=8]res://Assets/UI/EU.png[/img] Wheel Visual Node[/b]
## Assign the visual [Node3D] (e.g., a MeshInstance3D) that represents this wheel's model.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Nodo Visual de la Rueda
## Asigna el [Node3D] visual (ej. un MeshInstance3D) que representa el modelo de esta rueda.
@export var wheel_node : Node3D

var wheel_mass := 15.0
var tire_radius := 0.3
var tire_width := 205.0
var ackermann := 0.15
var contact_patch := 0.2
var braking_grip_multiplier := 1.4
var surface_type := ""
var tire_stiffnesses := { "Road" : 5.0, "Dirt" : 0.5, "Grass" : 0.5 }
var coefficient_of_friction := { "Road" : 2.0, "Dirt" : 1.4, "Grass" : 1.0 }
var rolling_resistance := { "Road" : 1.0, "Dirt" : 2.0, "Grass" : 4.0 }
var lateral_grip_assist := { "Road" : 0.05, "Dirt" : 0.0, "Grass" : 0.0}
var longitudinal_grip_ratio := { "Road" : 0.5, "Dirt": 0.5, "Grass" : 0.5}

var spring_length := 0.15
var spring_rate := 0.0
var slow_bump := 0.0
var fast_bump := 0.0
var slow_rebound := 0.0
var fast_rebound := 0.0
var fast_damp_threshold := 127.0
var antiroll := 0.0
var toe := 0.0
var bump_stop_multiplier := 1.0
var wheel_to_body_torque_multiplier := 0.0
var mass_over_wheel := 0.0

var wheel_moment := 0.0
var spin := 0.0
var spin_velocity_diff := 0.0
var spring_force := 0.0
var applied_torque := 0.0
var local_velocity := Vector3.ZERO
var previous_velocity := Vector3.ZERO
var previous_global_position := Vector3.ZERO
var force_vector := Vector2.ZERO
var slip_vector := Vector2.ZERO
var previous_compression := 0.0
var spring_current_length := 0.0
var max_spring_length := 0.0
var antiroll_force := 0.0
var damping_force := 0.0
var steering_ratio := 0.0
var last_collider
var last_collision_point := Vector3.ZERO
var last_collision_normal := Vector3.ZERO
var current_cof := 0.0
var current_rolling_resistance := 0.0
var current_lateral_grip_assist := 0.0
var current_longitudinal_grip_ratio := 0.0
var current_tire_stiffness := 0.0
var abs_enable_time := 0.0
var abs_pulse_time := 0.3
var abs_spin_difference_threshold := -12.0
var limit_spin := false
var is_driven := false
var opposite_wheel : Wheel
var beam_axle := 0.0

var suspension_force: Vector3 = Vector3.ZERO
var lateral_force: Vector3 = Vector3.ZERO
var longitudinal_force: Vector3 = Vector3.ZERO

var handbrake_active: bool = false
var is_drifting: bool = false

var vehicle : Vehicle

func _process(delta : float) -> void:
	if wheel_node:
		wheel_node.position.y = minf(0.0, -spring_current_length)
		if not is_zero_approx(beam_axle):
			var wheel_lookat_vector := (opposite_wheel.transform * opposite_wheel.wheel_node.position) - (transform * wheel_node.position)
			wheel_node.rotation.z = wheel_lookat_vector.angle_to(Vector3.RIGHT * beam_axle) * signf(wheel_lookat_vector.y * beam_axle)
		wheel_node.rotation.x -= (wrapf(spin * delta, 0, TAU))
		
func initialize() -> void:
	wheel_node.rotation_order = EULER_ORDER_ZXY
	wheel_moment = 0.5 * wheel_mass * pow(tire_radius, 2)
	set_target_position(Vector3.DOWN * (spring_length + tire_radius))
	vehicle = get_parent().get_parent()
	max_spring_length = spring_length
	current_cof = coefficient_of_friction[surface_type]
	current_rolling_resistance = rolling_resistance[surface_type]
	current_lateral_grip_assist = lateral_grip_assist[surface_type]
	current_longitudinal_grip_ratio = longitudinal_grip_ratio[surface_type]
	current_tire_stiffness = 1000000.0 + 8000000.0 * tire_stiffnesses[surface_type]

func steer(input : float, max_steering_angle : float):
	input *= steering_ratio
	rotation.y = (max_steering_angle * (input + (1 - cos(input * 0.5 * PI)) * ackermann)) + toe

func process_torque(drive : float, drive_inertia : float, brake_torque : float, allow_abs : bool, delta : float) -> float:
	var net_torque := force_vector.y * tire_radius
	var previous_spin := spin
	net_torque += drive

	if abs_enable_time > vehicle.delta_time:
		brake_torque = 0.0
		allow_abs = false
	
	if absf(spin) > 5.0 and spin_velocity_diff < abs_spin_difference_threshold:
		if allow_abs and brake_torque > 0.0:
			brake_torque = 0.0
			abs_enable_time = vehicle.delta_time + abs_pulse_time

	if is_zero_approx(spin):
		applied_torque = absf(drive - brake_torque)
	else:
		applied_torque = absf(drive - (brake_torque * signf(spin)))

	if absf(spin) < 5.0 and brake_torque > absf(net_torque):
		if allow_abs and absf(local_velocity.z) > 2.0:
			abs_enable_time = vehicle.delta_time + abs_pulse_time
		else:
			spin = 0.0
	else:
		net_torque -= brake_torque * signf(spin)
		var new_spin : float = spin + ((net_torque / (wheel_moment + drive_inertia)) * delta)
		if signf(spin) != signf(new_spin) and brake_torque > absf(drive):
			new_spin = 0.0
		spin = new_spin

	if is_zero_approx(drive * delta):
		return 0.5
	else:
		return (spin - previous_spin) * (wheel_moment + drive_inertia) / (drive * delta)

func process_forces(opposite_compression : float, braking : bool, delta : float) -> float:
	force_raycast_update()
	previous_velocity = local_velocity
	local_velocity = (global_position - previous_global_position) / delta * global_transform.basis
	previous_global_position = global_position
	
	if is_colliding():
		last_collider = get_collider()
		last_collision_point = get_collision_point()
		last_collision_normal = get_collision_normal()
		var surface_groups : Array[StringName] = last_collider.get_groups()
		if surface_groups.size() > 0:
			if surface_type != surface_groups[0]:
				surface_type = surface_groups[0]
				current_cof = coefficient_of_friction[surface_type]
				current_rolling_resistance = rolling_resistance[surface_type]
				current_lateral_grip_assist = lateral_grip_assist[surface_type]
				current_longitudinal_grip_ratio = longitudinal_grip_ratio[surface_type]
				current_tire_stiffness = 1000000.0 + 8000000.0 * tire_stiffnesses[surface_type]
	else:
		last_collider = null
	
	var compression := process_suspension(opposite_compression, delta)
	
	if is_colliding() and last_collider:
		process_tires(braking, delta)
		var contact := last_collision_point - vehicle.global_position

		suspension_force = last_collision_normal * spring_force
		lateral_force = global_transform.basis.x * force_vector.x
		longitudinal_force = global_transform.basis.z * force_vector.y

		if spring_force > 0.0:
			vehicle.apply_force(suspension_force, contact)
		else:
			vehicle.apply_force(-global_transform.basis.y * vehicle.mass, global_position - vehicle.global_position)

		vehicle.apply_force(lateral_force, contact)
		vehicle.apply_force(longitudinal_force, contact)

		if braking:
			wheel_to_body_torque_multiplier = 1.0 / (braking_grip_multiplier + 1.0)
		vehicle.apply_force(-global_transform.basis.y * force_vector.y * 0.5 * wheel_to_body_torque_multiplier, to_global(Vector3.FORWARD * tire_radius))
		vehicle.apply_force(global_transform.basis.y * force_vector.y * 0.5 * wheel_to_body_torque_multiplier, to_global(Vector3.BACK * tire_radius))
		
		return compression
	
	else:
		force_vector = Vector2.ZERO
		slip_vector = Vector2.ZERO
		spin -= signf(spin) * delta * 2.0 / wheel_moment
		suspension_force = Vector3.ZERO
		lateral_force = Vector3.ZERO
		longitudinal_force = Vector3.ZERO
		
		return 0.0

func process_suspension(opposite_compression : float, delta : float) -> float:
	if is_colliding() and last_collider:
		spring_current_length = last_collision_point.distance_to(global_position) - tire_radius
	else:
		spring_current_length = spring_length
	
	var no_contact := false
	if spring_current_length > max_spring_length:
		spring_current_length = max_spring_length
		no_contact = true
	
	var bottom_out := false
	if spring_current_length < 0.0:
		spring_current_length = 0.0
		bottom_out = true
	
	var compression := (spring_length - spring_current_length) * 1000.0
	
	var spring_speed_mm_per_seconds := (compression - previous_compression) / delta
	previous_compression = compression
	
	spring_force = compression * spring_rate
	antiroll_force = antiroll * (compression - opposite_compression)
	spring_force += antiroll_force
	
	var bottom_out_damping := 0.0
	var bottom_out_damping_fast := 0.0
	var bottom_out_force := 0.0
	if bottom_out:
		var gravity_on_spring := clampf(global_transform.basis.y.dot(-vehicle.current_gravity.normalized()), 0.0, 1.0)
		bottom_out_force = (((mass_over_wheel * clampf(spring_speed_mm_per_seconds * 0.001, 0.0, 5.0)) / delta) + (mass_over_wheel * vehicle.current_gravity.length() * gravity_on_spring)) * bump_stop_multiplier
		bottom_out_damping = -slow_bump
		bottom_out_damping_fast = -fast_bump
	
	if spring_speed_mm_per_seconds >= 0:
		if spring_speed_mm_per_seconds > fast_damp_threshold:
			damping_force = ((spring_speed_mm_per_seconds - fast_damp_threshold) * (fast_bump + bottom_out_damping_fast)) + (fast_damp_threshold * (slow_bump + bottom_out_damping))
		else:
			damping_force = spring_speed_mm_per_seconds * (slow_bump + bottom_out_damping)
	else :
		if spring_speed_mm_per_seconds < -fast_damp_threshold:
			damping_force = ((spring_speed_mm_per_seconds + fast_damp_threshold) * fast_rebound) + (-fast_damp_threshold * slow_rebound)
		else:
			damping_force = spring_speed_mm_per_seconds * slow_rebound
	
	spring_force += damping_force
	
	spring_force = maxf(0, spring_force + bottom_out_force)
	
	max_spring_length = clampf((((spring_force / wheel_mass) - spring_speed_mm_per_seconds) * delta * 0.001) + spring_current_length, 0.0, spring_length)

	if no_contact:
		spring_force = 0.0
	
	return compression

func process_tires(braking : bool, delta : float):
	var local_planar := Vector2(local_velocity.x, local_velocity.z).normalized() * clampf(local_velocity.length(), 0.0, 1.0)
	slip_vector.x = asin(clampf(-local_planar.x, -1.0, 1.0))
	slip_vector.y = 0.0
	
	var wheel_velocity := spin * tire_radius
	spin_velocity_diff = wheel_velocity + local_velocity.z
	var needed_rolling_force := ((spin_velocity_diff * wheel_moment) / tire_radius) / delta
	var max_y_force := 0.0

	if absf(applied_torque) > absf(needed_rolling_force):
		max_y_force = absf(applied_torque / tire_radius)
	else:
		max_y_force = absf(needed_rolling_force / tire_radius)
	
	var max_x_force := 0.0
	max_x_force = absf(mass_over_wheel * local_velocity.x) / delta
	
	var z_sign := signf(-local_velocity.z)
	if local_velocity.z == 0.0:
		z_sign = 1.0
	
	slip_vector.y = ((absf(local_velocity.z) - (wheel_velocity * z_sign)) / (1.0 + absf(local_velocity.z)))
	
	if slip_vector.is_zero_approx():
		slip_vector = Vector2(0.0001, 0.0001)
	
	var cornering_stiffness := 0.5 * current_tire_stiffness * pow(contact_patch, 2.0)
	var friction := current_cof * spring_force - (spring_force / (tire_width * contact_patch * 0.2))
	var deflect := 1.0 / (sqrt(pow(cornering_stiffness * slip_vector.y, 2.0) + pow(cornering_stiffness * slip_vector.x, 2.0)))
	
	var braking_help := 1.0
	if slip_vector.y > 0.3 and braking:
		braking_help = (1 + (braking_grip_multiplier * clampf(absf(slip_vector.y), 0.0, 1.0)))
	
	var crit_length := friction * (1.0 - slip_vector.y) * contact_patch * (0.5 * deflect)
	if crit_length >= contact_patch:
		force_vector.y = cornering_stiffness * slip_vector.y / (1.0 - slip_vector.y)
		force_vector.x = cornering_stiffness * slip_vector.x / (1.0 - slip_vector.y)
	else:
		var brushx := (1.0 - friction * (1.0 - slip_vector.y) * (0.25 * deflect)) * deflect
		force_vector.y = friction * current_longitudinal_grip_ratio * cornering_stiffness * slip_vector.y * brushx * braking_help * z_sign
		force_vector.x = friction * cornering_stiffness * slip_vector.x * brushx * (absf(slip_vector.x * current_lateral_grip_assist) + 1.0)
	
	if absf(force_vector.y) > absf(max_y_force):
		force_vector.y = max_y_force * signf(force_vector.y)
		limit_spin = true
	else:
		limit_spin = false
	
	if absf(force_vector.x) > max_x_force:
		force_vector.x = max_x_force * signf(force_vector.x)
	
	force_vector.y -= process_rolling_resistance() * signf(local_velocity.z)

func process_rolling_resistance() -> float:
	var rolling_resistance_coefficient := 0.005 + (0.5 * (0.01 + (0.0095 * pow(local_velocity.z * 0.036, 2))))
	return rolling_resistance_coefficient * spring_force * current_rolling_resistance

func get_reaction_torque() -> float:
	return force_vector.y * tire_radius

func get_friction(normal_force : float, surface : String) -> float:
	var surface_cof := 1.0
	if coefficient_of_friction.has(surface):
		surface_cof = coefficient_of_friction[surface]
	return surface_cof * normal_force - (normal_force / (tire_width * contact_patch * 0.2))
