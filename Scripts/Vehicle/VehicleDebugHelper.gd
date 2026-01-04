extends Node
class_name VehicleDebugHelper

@export var vehicle_node: Vehicle
@export var vehicle_collision: CollisionShape3D

@export var debug_active := false:
	set(value):
		if debug_active == value: return
		debug_active = value
		_update_debug_mode()

var ray_front: RayCast3D = null
var ray_rear: RayCast3D = null

# Velocidad de crecimiento/encogimiento (suave pero reactivo)
const GROW_SPEED := 18.0
const SHRINK_SPEED := 12.0

var current_front := 0.0
var current_rear := 0.0

func _ready() -> void:
	_update_debug_mode()
	#vehicle_node.vehicle_preset._print_full_config()

func _process(delta: float) -> void:
	if not debug_active or not ray_front or not ray_rear or not vehicle_node:
		return

	# Detectamos si estamos en reversa
	var in_reverse = vehicle_node.current_gear <= 0

	# --- ACELERACIÓN / FRENO ---
	var accel = vehicle_node.throttle_input   # 0 a 1
	var brake  = vehicle_node.brake_input     # 0 a 1

	# Invertimos si estamos en reversa
	if in_reverse:
		accel = vehicle_node.brake_input
		brake = vehicle_node.throttle_input

	# Objetivos según input
	var target_front = accel * 3.0   # acelera fuerte → rayo adelante
	var target_rear  = brake * 3.0   # frena fuerte → rayo atrás

	# Movemos suavemente
	current_front = move_toward(current_front, target_front, GROW_SPEED * delta if target_front > current_front else SHRINK_SPEED * delta)
	current_rear  = move_toward(current_rear,  target_rear,  GROW_SPEED * delta if target_rear  > current_rear  else SHRINK_SPEED * delta)

	# Aplicamos
	ray_front.target_position = Vector3(0, 0, -current_front)  # adelante = Z negativo
	ray_rear.target_position  = Vector3(0, 0,  current_rear)   # atrás = Z positivo

func _update_debug_mode() -> void:
	if not debug_active or not vehicle_node:
		if vehicle_collision:
			vehicle_collision.visible = false
		return

	if vehicle_collision:
		vehicle_collision.visible = true

	# Rayos laterales morados (los tuyos originales)
	_add_debug_ray(vehicle_node.front_right_wheel, Vector3( 3, 0, 0), Color("8338ec"))
	_add_debug_ray(vehicle_node.front_left_wheel,  Vector3(-3, 0, 0), Color("8338ec"))
	_add_debug_ray(vehicle_node.rear_right_wheel,  Vector3( 3, 0, 0), Color("8338ec"))
	_add_debug_ray(vehicle_node.rear_left_wheel,   Vector3(-3, 0, 0), Color("8338ec"))

	# Rayos longitudinales ROSAS
	if vehicle_collision and vehicle_collision.shape is BoxShape3D:
		var box = vehicle_collision.shape as BoxShape3D
		var half_z = box.size.z * 0.5

		# Delantero (crece hacia adelante con aceleración)
		ray_front = RayCast3D.new()
		ray_front.name = "DEBUG_RAY_LONGITUDINAL"
		ray_front.position = Vector3(0, 0, -half_z)
		ray_front.target_position = Vector3(0, 0, 0)
		ray_front.enabled = true
		ray_front.collision_mask = 0
		ray_front.collide_with_areas = false
		ray_front.collide_with_bodies = false
		ray_front.debug_shape_custom_color = Color("ff006e")
		ray_front.debug_shape_thickness = 12
		vehicle_collision.add_child(ray_front)

		# Trasero (crece hacia atrás con frenada)
		ray_rear = RayCast3D.new()
		ray_rear.name = "DEBUG_RAY_LONGITUDINAL"
		ray_rear.position = Vector3(0, 0, half_z)
		ray_rear.target_position = Vector3(0, 0, 0)
		ray_rear.enabled = true
		ray_rear.collision_mask = 0
		ray_rear.collide_with_areas = false
		ray_rear.collide_with_bodies = false
		ray_rear.debug_shape_custom_color = Color("ff006e")
		ray_rear.debug_shape_thickness = 12
		vehicle_collision.add_child(ray_rear)

	_print_full_config()

func _add_debug_ray(wheel: Node3D, target: Vector3, color: Color) -> void:
	if not wheel: return
	var ray := RayCast3D.new()
	ray.name = "DEBUG_RAY_LATERAL"
	ray.position = Vector3.ZERO
	ray.target_position = target
	ray.enabled = true
	ray.collision_mask = 0
	ray.collide_with_areas = false
	ray.collide_with_bodies = false
	ray.debug_shape_custom_color = color
	ray.debug_shape_thickness = 12
	wheel.add_child(ray)

func _print_full_config() -> void:
	print("=== CONFIGURACIÓN COMPLETA DEL VEHÍCULO ===")
	# --- Wheel Nodes ---
	print("[Wheel Nodes]")
	print(" front_left_wheel: ", vehicle_node.front_left_wheel)
	print(" front_right_wheel: ", vehicle_node.front_right_wheel)
	print(" rear_left_wheel: ", vehicle_node.rear_left_wheel)
	print(" rear_right_wheel: ", vehicle_node.rear_right_wheel)
	# --- Engine ---
	print("[Engine]")
	print(" engine_on: ", vehicle_node.engine_on)
	# --- Steering ---
	print("[Steering]")
	print(" steering_speed: ", vehicle_node.steering_speed)
	print(" countersteer_speed: ", vehicle_node.countersteer_speed)
	print(" steering_speed_decay: ", vehicle_node.steering_speed_decay)
	print(" steering_slip_assist: ", vehicle_node.steering_slip_assist)
	print(" countersteer_assist: ", vehicle_node.countersteer_assist)
	print(" steering_exponent: ", vehicle_node.steering_exponent)
	print(" max_steering_angle: ", rad_to_deg(vehicle_node.max_steering_angle), "° (", vehicle_node.max_steering_angle, " rad)")
	print(" front_steering_ratio: ", vehicle_node.front_steering_ratio)
	print(" rear_steering_ratio: ", vehicle_node.rear_steering_ratio)
	# --- Throttle / Braking ---
	print("[Throttle and Braking]")
	print(" throttle_speed: ", vehicle_node.throttle_speed)
	print(" throttle_steering_adjust: ", vehicle_node.throttle_steering_adjust)
	print(" braking_speed: ", vehicle_node.braking_speed)
	print(" brake_force_multiplier: ", vehicle_node.brake_force_multiplier)
	print(" front_brake_bias: ", vehicle_node.front_brake_bias)
	print(" traction_control_max_slip: ", vehicle_node.traction_control_max_slip)
	print(" front_abs_pulse_time: ", vehicle_node.front_abs_pulse_time)
	print(" front_abs_spin_difference_threshold: ", vehicle_node.front_abs_spin_difference_threshold)
	print(" rear_abs_pulse_time: ", vehicle_node.rear_abs_pulse_time)
	print(" rear_abs_spin_difference_threshold: ", vehicle_node.rear_abs_spin_difference_threshold)
	# --- Stability ---
	print("[Stability]")
	print(" enable_stability: ", vehicle_node.enable_stability)
	print(" stability_yaw_engage_angle: ", vehicle_node.stability_yaw_engage_angle)
	print(" stability_yaw_strength: ", vehicle_node.stability_yaw_strength)
	print(" stability_yaw_ground_multiplier: ", vehicle_node.stability_yaw_ground_multiplier)
	print(" stability_upright_spring: ", vehicle_node.stability_upright_spring)
	print(" stability_upright_damping: ", vehicle_node.stability_upright_damping)
	# --- Motor ---
	print("[Motor]")
	print(" max_torque: ", vehicle_node.max_torque)
	print(" max_rpm: ", vehicle_node.max_rpm)
	print(" idle_rpm: ", vehicle_node.idle_rpm)
	print(" motor_drag: ", vehicle_node.motor_drag)
	print(" motor_brake: ", vehicle_node.motor_brake)
	print(" motor_moment: ", vehicle_node.motor_moment)
	print(" clutch_out_rpm: ", vehicle_node.clutch_out_rpm)
	print(" max_clutch_torque_ratio: ", vehicle_node.max_clutch_torque_ratio)
	# --- Torque Curve ---
	print(" torque_curve: ", "ASIGNADA" if vehicle_node.torque_curve != null else "FALTANTE")
	if vehicle_node.torque_curve != null:
		print(" [Puntos de la curva de torque]")
		for i in range(vehicle_node.torque_curve.get_point_count()):
			var pos = vehicle_node.torque_curve.get_point_position(i)
			var rpm = pos.x * vehicle_node.max_rpm
			var torque = pos.y * vehicle_node.max_torque
			print(" Punto ", i, ": RPM=", int(rpm), " Torque=", int(torque), " Nm")
	else:
		print(" [ADVERTENCIA] No hay curva asignada.")
	# --- Nitro ---
	print("[Nitro System]")
	print(" nitro_enabled: ", vehicle_node.nitro_enabled)
	print(" nitro_multiplier: ", vehicle_node.nitro_multiplier)
	print(" nitro_duration: ", vehicle_node.nitro_duration)
	print(" nitro_recharge_time: ", vehicle_node.nitro_recharge_time)
	print(" nitro_drain_rate: ", vehicle_node.nitro_drain_rate)
	print(" nitro_recharge_rate: ", vehicle_node.nitro_recharge_rate)
	# --- Gearbox ---
	print("[Gearbox]")
	print(" gear_ratios: ", vehicle_node.gear_ratios)
	print(" final_drive: ", vehicle_node.final_drive)
	print(" reverse_ratio: ", vehicle_node.reverse_ratio)
	print(" shift_time: ", vehicle_node.shift_time)
	print(" automatic_transmission: ", vehicle_node.automatic_transmission)
	print(" automatic_time_between_shifts: ", vehicle_node.automatic_time_between_shifts)
	print(" gear_inertia: ", vehicle_node.gear_inertia)
	# --- Drivetrain ---
	print("[Drivetrain]")
	print(" front_torque_split: ", vehicle_node.front_torque_split)
	print(" variable_torque_split: ", vehicle_node.variable_torque_split)
	print(" front_variable_split: ", vehicle_node.front_variable_split)
	print(" variable_split_speed: ", vehicle_node.variable_split_speed)
	print(" front_locking_differential_engage_torque: ", vehicle_node.front_locking_differential_engage_torque)
	print(" rear_locking_differential_engage_torque: ", vehicle_node.rear_locking_differential_engage_torque)
	# --- Suspension ---
	print("[Suspension]")
	print(" vehicle_mass: ", vehicle_node.vehicle_mass)
	print(" front_weight_distribution: ", vehicle_node.front_weight_distribution)
	print(" center_of_gravity_height_offset: ", vehicle_node.center_of_gravity_height_offset)
	print(" inertia_multiplier: ", vehicle_node.inertia_multiplier)
	# Front Axle
	print(" [Front Axle]")
	print(" front_spring_length: ", vehicle_node.front_spring_length)
	print(" front_resting_ratio: ", vehicle_node.front_resting_ratio)
	print(" front_damping_ratio: ", vehicle_node.front_damping_ratio)
	print(" front_bump_damp_multiplier: ", vehicle_node.front_bump_damp_multiplier)
	print(" front_rebound_damp_multiplier: ", vehicle_node.front_rebound_damp_multiplier)
	print(" front_arb_ratio: ", vehicle_node.front_arb_ratio)
	print(" front_camber: ", rad_to_deg(vehicle_node.front_camber))
	print(" front_toe: ", rad_to_deg(vehicle_node.front_toe))
	print(" front_bump_stop_multiplier: ", vehicle_node.front_bump_stop_multiplier)
	print(" front_beam_axle: ", vehicle_node.front_beam_axle)
	# Rear Axle
	print(" [Rear Axle]")
	print(" rear_spring_length: ", vehicle_node.rear_spring_length)
	print(" rear_resting_ratio: ", vehicle_node.rear_resting_ratio)
	print(" rear_damping_ratio: ", vehicle_node.rear_damping_ratio)
	print(" rear_bump_damp_multiplier: ", vehicle_node.rear_bump_damp_multiplier)
	print(" rear_rebound_damp_multiplier: ", vehicle_node.rear_rebound_damp_multiplier)
	print(" rear_arb_ratio: ", vehicle_node.rear_arb_ratio)
	print(" rear_camber: ", rad_to_deg(vehicle_node.rear_camber))
	print(" rear_toe: ", rad_to_deg(vehicle_node.rear_toe))
	print(" rear_bump_stop_multiplier: ", vehicle_node.rear_bump_stop_multiplier)
	print(" rear_beam_axle: ", vehicle_node.rear_beam_axle)
	# Tires
	print("[Tires]")
	print(" contact_patch: ", vehicle_node.contact_patch)
	print(" braking_grip_multiplier: ", vehicle_node.braking_grip_multiplier)
	print(" wheel_to_body_torque_multiplier: ", vehicle_node.wheel_to_body_torque_multiplier)
	print(" tire_stiffnesses: ", vehicle_node.tire_stiffnesses)
	print(" coefficient_of_friction: ", vehicle_node.coefficient_of_friction)
	print(" rolling_resistance: ", vehicle_node.rolling_resistance)
	print(" lateral_grip_assist: ", vehicle_node.lateral_grip_assist)
	print(" longitudinal_grip_ratio: ", vehicle_node.longitudinal_grip_ratio)
	print(" [Front Tires]")
	print(" radius: ", vehicle_node.front_tire_radius)
	print(" width: ", vehicle_node.front_tire_width)
	print(" mass: ", vehicle_node.front_wheel_mass)
	print(" [Rear Tires]")
	print(" radius: ", vehicle_node.rear_tire_radius)
	print(" width: ", vehicle_node.rear_tire_width)
	print(" mass: ", vehicle_node.rear_wheel_mass)
	# Aerodynamics
	print("[Aerodynamics]")
	print(" coefficient_of_drag: ", vehicle_node.coefficient_of_drag)
	print(" air_density: ", vehicle_node.air_density)
	print(" frontal_area: ", vehicle_node.frontal_area)
