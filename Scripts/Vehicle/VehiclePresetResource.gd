@tool
class_name VehiclePreset
extends Resource

@export_group("Engine")
@export var engine_on: bool = false

@export_group("Steering")
@export var steering_speed: float = 4.25
@export var countersteer_speed: float = 11.0
@export var steering_speed_decay: float = 0.20
@export var steering_slip_assist: float = 0.15
@export var countersteer_assist: float = 0.9
@export var steering_exponent: float = 1.5
@export var max_steering_angle: float = deg_to_rad(40.0)
@export var front_steering_ratio: float = 1.0
@export var rear_steering_ratio: float = 0.0

@export_group("Throttle and Braking")
@export var throttle_speed: float = 20.0
@export var throttle_steering_adjust: float = 0.1
@export var braking_speed: float = 10.0
@export var brake_force_multiplier: float = 1.0
@export var front_brake_bias: float = -1.0
@export var traction_control_max_slip: float = 8.0
@export var front_abs_pulse_time: float = 0.03
@export var front_abs_spin_difference_threshold: float = 12.0
@export var rear_abs_pulse_time: float = 0.03
@export var rear_abs_spin_difference_threshold: float = 12.0

@export_group("Stability")
@export var enable_stability: bool = true
@export var stability_yaw_engage_angle: float = 0.0
@export var stability_yaw_strength: float = 6.0
@export var stability_yaw_ground_multiplier: float = 2.0
@export var stability_upright_spring: float = 1.0
@export var stability_upright_damping: float = 1000.0

@export_group("Motor")
@export var max_torque: float = 300.0
@export var max_rpm: float = 7000.0
@export var idle_rpm: float = 1000.0
@export var torque_curve: Curve
@export var motor_drag: float = 0.005
@export var motor_brake: float = 10.0
@export var motor_moment: float = 0.5
@export var clutch_out_rpm: float = 3000.0
@export var max_clutch_torque_ratio: float = 1.6

@export_group("Nitro System")
@export var nitro_enabled: bool = true
@export var nitro_multiplier: float = 2.0
@export var nitro_duration: float = 3.0
@export var nitro_recharge_time: float = 10.0
@export var nitro_drain_rate: float = 1.0 / 3.0
@export var nitro_recharge_rate: float = 1.0 / 10.0

@export_group("Gearbox")
@export var gear_ratios: Array[float] = [3.8, 2.3, 1.7, 1.3, 1.0, 0.8]
@export var final_drive: float = 3.2
@export var reverse_ratio: float = 3.3
@export var shift_time: float = 0.3
@export var automatic_transmission: bool = true
@export var automatic_time_between_shifts: float = 1000.0
@export var gear_inertia: float = 0.02

@export_group("Drivetrain")
@export var front_torque_split: float = 0.0
@export var variable_torque_split: bool = false
@export var front_variable_split: float = 0.0
@export var variable_split_speed: float = 1.0
@export var front_locking_differential_engage_torque: float = 200.0
@export var front_torque_vectoring: float = 0.0
@export var rear_locking_differential_engage_torque: float = 200.0
@export var rear_torque_vectoring: float = 0.0

@export_group("Suspension")
@export var vehicle_mass: float = 1500.0
@export var front_weight_distribution: float = 0.5
@export var center_of_gravity_height_offset: float = -0.2
@export var inertia_multiplier: float = 1.2
@export var front_spring_length: float = 0.15
@export var front_resting_ratio: float = 0.5
@export var front_damping_ratio: float = 0.4
@export var front_bump_damp_multiplier: float = 0.6667
@export var front_rebound_damp_multiplier: float = 1.5
@export var front_arb_ratio: float = 0.25
@export var front_camber: float = 0.01745329
@export var front_toe: float = 0.01
@export var front_bump_stop_multiplier: float = 1.0
@export var front_beam_axle: bool = false
@export var rear_spring_length: float = 0.2
@export var rear_resting_ratio: float = 0.5
@export var rear_damping_ratio: float = 0.4
@export var rear_bump_damp_multiplier: float = 0.6667
@export var rear_rebound_damp_multiplier: float = 1.5
@export var rear_arb_ratio: float = 0.25
@export var rear_camber: float = 0.01745329
@export var rear_toe: float = 0.01
@export var rear_bump_stop_multiplier: float = 1.0
@export var rear_beam_axle: bool = false

@export_group("Tires")
@export var contact_patch: float = 0.2
@export var braking_grip_multiplier: float = 1.5
@export var wheel_to_body_torque_multiplier: float = 1.0
@export var tire_stiffnesses: Dictionary = { "Road": 10.0, "Dirt": 0.5, "Grass": 0.5 }
@export var coefficient_of_friction: Dictionary = { "Road": 3.0, "Dirt": 2.4, "Grass": 2.0 }
@export var rolling_resistance: Dictionary = { "Road": 1.0, "Dirt": 2.0, "Grass": 4.0 }
@export var lateral_grip_assist: Dictionary = { "Road": 0.05, "Dirt": 0.0, "Grass": 0.0 }
@export var longitudinal_grip_ratio: Dictionary = { "Road": 0.5, "Dirt": 0.5, "Grass": 0.5 }
@export var front_tire_radius: float = 0.3
@export var front_tire_width: float = 245.0
@export var front_wheel_mass: float = 15.0
@export var rear_tire_radius: float = 0.3
@export var rear_tire_width: float = 245.0
@export var rear_wheel_mass: float = 15.0

@export_group("Aerodynamics")
@export var coefficient_of_drag: float = 0.3
@export var air_density: float = 1.225
@export var frontal_area: float = 2.0

func _print_full_config() -> void:
	print("=== CONFIGURACIÓN COMPLETA DEL VEHÍCULO ===")
	# --- Engine ---
	print("[Engine]")
	print(" engine_on: ", engine_on)
	# --- Steering ---
	print("[Steering]")
	print(" steering_speed: ", steering_speed)
	print(" countersteer_speed: ", countersteer_speed)
	print(" steering_speed_decay: ", steering_speed_decay)
	print(" steering_slip_assist: ", steering_slip_assist)
	print(" countersteer_assist: ", countersteer_assist)
	print(" steering_exponent: ", steering_exponent)
	print(" max_steering_angle: ", rad_to_deg(max_steering_angle), "° (", max_steering_angle, " rad)")
	print(" front_steering_ratio: ", front_steering_ratio)
	print(" rear_steering_ratio: ", rear_steering_ratio)
	# --- Throttle / Braking ---
	print("[Throttle and Braking]")
	print(" throttle_speed: ", throttle_speed)
	print(" throttle_steering_adjust: ", throttle_steering_adjust)
	print(" braking_speed: ", braking_speed)
	print(" brake_force_multiplier: ", brake_force_multiplier)
	print(" front_brake_bias: ", front_brake_bias)
	print(" traction_control_max_slip: ", traction_control_max_slip)
	print(" front_abs_pulse_time: ", front_abs_pulse_time)
	print(" front_abs_spin_difference_threshold: ", front_abs_spin_difference_threshold)
	print(" rear_abs_pulse_time: ", rear_abs_pulse_time)
	print(" rear_abs_spin_difference_threshold: ", rear_abs_spin_difference_threshold)
	# --- Stability ---
	print("[Stability]")
	print(" enable_stability: ", enable_stability)
	print(" stability_yaw_engage_angle: ", stability_yaw_engage_angle)
	print(" stability_yaw_strength: ", stability_yaw_strength)
	print(" stability_yaw_ground_multiplier: ", stability_yaw_ground_multiplier)
	print(" stability_upright_spring: ", stability_upright_spring)
	print(" stability_upright_damping: ", stability_upright_damping)
	# --- Motor ---
	print("[Motor]")
	print(" max_torque: ", max_torque)
	print(" max_rpm: ", max_rpm)
	print(" idle_rpm: ", idle_rpm)
	print(" motor_drag: ", motor_drag)
	print(" motor_brake: ", motor_brake)
	print(" motor_moment: ", motor_moment)
	print(" clutch_out_rpm: ", clutch_out_rpm)
	print(" max_clutch_torque_ratio: ", max_clutch_torque_ratio)
	# --- Torque Curve ---
	print(" torque_curve: ", "ASIGNADA" if torque_curve != null else "FALTANTE")
	if torque_curve != null:
		print(" [Puntos de la curva de torque]")
		for i in range(torque_curve.get_point_count()):
			var pos = torque_curve.get_point_position(i)
			var rpm = pos.x * max_rpm
			var torque = pos.y * max_torque
			print(" Punto ", i, ": RPM=", int(rpm), " Torque=", int(torque), " Nm")
	else:
		print(" [ADVERTENCIA] No hay curva asignada.")
	# --- Nitro ---
	print("[Nitro System]")
	print(" nitro_enabled: ", nitro_enabled)
	print(" nitro_multiplier: ", nitro_multiplier)
	print(" nitro_duration: ", nitro_duration)
	print(" nitro_recharge_time: ", nitro_recharge_time)
	print(" nitro_drain_rate: ", nitro_drain_rate)
	print(" nitro_recharge_rate: ", nitro_recharge_rate)
	# --- Gearbox ---
	print("[Gearbox]")
	print(" gear_ratios: ", gear_ratios)
	print(" final_drive: ", final_drive)
	print(" reverse_ratio: ", reverse_ratio)
	print(" shift_time: ", shift_time)
	print(" automatic_transmission: ", automatic_transmission)
	print(" automatic_time_between_shifts: ", automatic_time_between_shifts)
	print(" gear_inertia: ", gear_inertia)
	# --- Drivetrain ---
	print("[Drivetrain]")
	print(" front_torque_split: ", front_torque_split)
	print(" variable_torque_split: ", variable_torque_split)
	print(" front_variable_split: ", front_variable_split)
	print(" variable_split_speed: ", variable_split_speed)
	print(" front_locking_differential_engage_torque: ", front_locking_differential_engage_torque)
	print(" rear_locking_differential_engage_torque: ", rear_locking_differential_engage_torque)
	# --- Suspension ---
	print("[Suspension]")
	print(" vehicle_mass: ", vehicle_mass)
	print(" front_weight_distribution: ", front_weight_distribution)
	print(" center_of_gravity_height_offset: ", center_of_gravity_height_offset)
	print(" inertia_multiplier: ", inertia_multiplier)
	# Front Axle
	print(" [Front Axle]")
	print(" front_spring_length: ", front_spring_length)
	print(" front_resting_ratio: ", front_resting_ratio)
	print(" front_damping_ratio: ", front_damping_ratio)
	print(" front_bump_damp_multiplier: ", front_bump_damp_multiplier)
	print(" front_rebound_damp_multiplier: ", front_rebound_damp_multiplier)
	print(" front_arb_ratio: ", front_arb_ratio)
	print(" front_camber: ", rad_to_deg(front_camber))
	print(" front_toe: ", rad_to_deg(front_toe))
	print(" front_bump_stop_multiplier: ", front_bump_stop_multiplier)
	print(" front_beam_axle: ", front_beam_axle)
	# Rear Axle
	print(" [Rear Axle]")
	print(" rear_spring_length: ", rear_spring_length)
	print(" rear_resting_ratio: ", rear_resting_ratio)
	print(" rear_damping_ratio: ", rear_damping_ratio)
	print(" rear_bump_damp_multiplier: ", rear_bump_damp_multiplier)
	print(" rear_rebound_damp_multiplier: ", rear_rebound_damp_multiplier)
	print(" rear_arb_ratio: ", rear_arb_ratio)
	print(" rear_camber: ", rad_to_deg(rear_camber))
	print(" rear_toe: ", rad_to_deg(rear_toe))
	print(" rear_bump_stop_multiplier: ", rear_bump_stop_multiplier)
	print(" rear_beam_axle: ", rear_beam_axle)
	# Tires
	print("[Tires]")
	print(" contact_patch: ", contact_patch)
	print(" braking_grip_multiplier: ", braking_grip_multiplier)
	print(" wheel_to_body_torque_multiplier: ", wheel_to_body_torque_multiplier)
	print(" tire_stiffnesses: ", tire_stiffnesses)
	print(" coefficient_of_friction: ", coefficient_of_friction)
	print(" rolling_resistance: ", rolling_resistance)
	print(" lateral_grip_assist: ", lateral_grip_assist)
	print(" longitudinal_grip_ratio: ", longitudinal_grip_ratio)
	print(" [Front Tires]")
	print(" radius: ", front_tire_radius)
	print(" width: ", front_tire_width)
	print(" mass: ", front_wheel_mass)
	print(" [Rear Tires]")
	print(" radius: ", rear_tire_radius)
	print(" width: ", rear_tire_width)
	print(" mass: ", rear_wheel_mass)
	# Aerodynamics
	print("[Aerodynamics]")
	print(" coefficient_of_drag: ", coefficient_of_drag)
	print(" air_density: ", air_density)
	print(" frontal_area: ", frontal_area)
