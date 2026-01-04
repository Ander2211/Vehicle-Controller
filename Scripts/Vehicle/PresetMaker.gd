extends Control

@onready var general_performance: VBoxContainer = %GeneralPerformance
@onready var handling_behavior: VBoxContainer = %HandlingBehavior
@onready var engine_feel: VBoxContainer = %EngineFeel
@onready var comfort_safety: VBoxContainer = %"Comfort&Safety"
@onready var dimensions_weight: VBoxContainer = %"Dimensions&Weight"
@onready var right_panel: PanelContainer = %RightPanel

@onready var target_top_speed_kmh: LineEdit = %TargetTopSpeedKmh
@onready var zero_to_hundred_time: LineEdit = %ZeroToHundredTime
@onready var drivetrain_type: OptionButton = %DrivetrainType
@onready var vehicle_usage: OptionButton = %VehicleUsage
@onready var handling_style: OptionButton = %HandlingStyle
@onready var vehicle_height: OptionButton = %VehicleHeight
@onready var suspension_stiffness: OptionButton = %SuspensionStiffness
@onready var engine_type: OptionButton = %EngineType
@onready var throttle_responsiveness: OptionButton = %ThrottleResponsiveness
@onready var driver_assist_level: OptionButton = %DriverAssistLevel
@onready var enable_traction_assists: OptionButton = %EnableTractionAssists
@onready var wheel_radius: LineEdit = %WheelRadius
@onready var wheel_width: LineEdit = %WheelWidth
@onready var estimated_mass_kg: LineEdit = %EstimatedMassKg

@onready var continue_1: Button = %Continue1
@onready var continue_2: Button = %Continue2
@onready var continue_3: Button = %Continue3
@onready var continue_4: Button = %Continue4
@onready var continue_5: Button = %Continue5
@onready var create: Button = %Create
@onready var preset_name: LineEdit = %PresetName
@onready var items: VBoxContainer = %Items
@onready var template: HBoxContainer = %Template

const KMH_TO_MS: float = 0.2777777778
const RPM_TO_RADS: float = 0.104719755
const DEG_TO_RAD: float = 0.0174532925

func _ready() -> void:

	drivetrain_type.add_item("Trasera"); drivetrain_type.add_item("Delantera"); drivetrain_type.add_item("Integral")
	vehicle_usage.add_item("Calle"); vehicle_usage.add_item("Pista"); vehicle_usage.add_item("Todo terreno")
	handling_style.add_item("Neutral"); handling_style.add_item("Subvirador"); handling_style.add_item("Sobrevirador")
	vehicle_height.add_item("Bajo (deportivo)"); vehicle_height.add_item("Medio"); vehicle_height.add_item("Alto (SUV)"); vehicle_height.selected = 1
	suspension_stiffness.add_item("Muy suave (cómodo)"); suspension_stiffness.add_item("Muy duro (preciso)")
	engine_type.add_item("Pequeño y ágil"); engine_type.add_item("Grande y potente"); engine_type.add_item("Eléctrico")
	throttle_responsiveness.add_item("Suave/moderado"); throttle_responsiveness.add_item("Inmediato/agresivo")
	driver_assist_level.add_item("Mínima (realista)"); driver_assist_level.add_item("Media"); driver_assist_level.add_item("Máxima (arcade)"); driver_assist_level.selected = 1
	enable_traction_assists.add_item("Si"); enable_traction_assists.add_item("No")

	_hide_all_sections()
	general_performance.visible = true
	right_panel.visible = false

	continue_1.pressed.connect(_on_continue_1)
	continue_2.pressed.connect(_on_continue_2)
	continue_3.pressed.connect(_on_continue_3)
	continue_4.pressed.connect(_on_continue_4)
	continue_5.pressed.connect(_on_continue_5)
	create.pressed.connect(_on_create_pressed)

func _hide_all_sections() -> void:
	general_performance.visible = false
	handling_behavior.visible = false
	engine_feel.visible = false
	comfort_safety.visible = false
	dimensions_weight.visible = false

func _on_continue_1() -> void: _hide_all_sections(); handling_behavior.visible = true
func _on_continue_2() -> void: _hide_all_sections(); engine_feel.visible = true
func _on_continue_3() -> void: _hide_all_sections(); comfort_safety.visible = true
func _on_continue_4() -> void: _hide_all_sections(); dimensions_weight.visible = true
func _on_continue_5() -> void: right_panel.visible = true; _generate_preview()

func _calculate_full_preset() -> VehiclePreset:
	var p = VehiclePreset.new()
	
	var top_speed     = maxf(target_top_speed_kmh.text.to_float(), 100.0)
	var accel_time    = maxf(zero_to_hundred_time.text.to_float(), 3.0)
	var drivetrain    = drivetrain_type.selected
	var usage         = vehicle_usage.selected
	var handling      = handling_style.selected
	var height        = vehicle_height.selected
	var stiff         = suspension_stiffness.selected
	var eng           = engine_type.selected
	var throttle_resp = throttle_responsiveness.selected
	var assist        = driver_assist_level.selected
	var tc_on         = enable_traction_assists.selected == 0
	
	var radius = wheel_radius.text.to_float()
	if radius <= 0.01: radius = 0.3
	var width = wheel_width.text.to_float()
	if width < 1.0: width = 205.0

	var input_mass = estimated_mass_kg.text.to_float()
	p.vehicle_mass = input_mass if input_mass >= 100.0 else 1400.0
	
	p.inertia_multiplier = maxf(lerp(1.2, 0.8, p.vehicle_mass / 2000.0), 0.9)
	p.center_of_gravity_height_offset = [-0.15, -0.25, -0.40][height]
	p.coefficient_of_drag = 0.22
	p.frontal_area = 1.8
	
	var front_dist = 0.50
	if handling == 1: front_dist = 0.55
	elif handling == 2: front_dist = 0.45
	p.front_weight_distribution = front_dist
	
	p.max_rpm = 7500.0
	p.idle_rpm = 1000.0

	p.max_torque = 240.0
	p.motor_moment = 0.12
	
	var curve = Curve.new()
	curve.min_value = 0.0
	curve.max_value = 1.0
	curve.add_point(Vector2(0.0, 0.5))
	curve.add_point(Vector2(0.6, 1.0))
	curve.add_point(Vector2(1.0, 0.7))
	p.torque_curve = curve
	
	p.engine_on = true
	p.front_torque_split = [0.0, 1.0, 0.5][drivetrain]

	p.gear_ratios.clear()
	p.gear_ratios.append(4.68)
	p.gear_ratios.append(2.52)
	p.gear_ratios.append(1.69)
	p.gear_ratios.append(1.21)
	p.gear_ratios.append(1.0)
	p.gear_ratios.append(1.0)
	
	var top_speed_m_s = 160.0 * KMH_TO_MS
	p.final_drive = (4000.0 * radius) / (top_speed_m_s * 1.0 * (60.0 / TAU))

	p.shift_time = 0.3
	p.clutch_out_rpm = 2000.0
	p.automatic_transmission = true
	p.gear_inertia = 0.02
	
	p.front_locking_differential_engage_torque = 200.0
	p.rear_locking_differential_engage_torque = 200.0
	if handling == 2: p.rear_locking_differential_engage_torque = 100.0

	p.front_spring_length = [0.10, 0.15, 0.25][height]
	p.rear_spring_length = p.front_spring_length + 0.03
	
	var FD = 1.0
	if stiff == 0: FD = 0.6
	elif stiff == 1: FD = 1.4
	
	p.front_damping_ratio = 0.4 * FD
	p.rear_damping_ratio = 0.4 * FD
	p.front_rebound_damp_multiplier = 1.5 * FD
	p.rear_rebound_damp_multiplier = 1.5 * FD
	p.front_bump_damp_multiplier = 0.6667 * FD
	p.rear_bump_damp_multiplier = 0.6667 * FD
	
	var front_arb_mod = 1.0
	var rear_arb_mod = 1.0
	if handling == 1:
		front_arb_mod = 1.5
		rear_arb_mod = 0.5
	elif handling == 2:
		front_arb_mod = 0.5
		rear_arb_mod = 1.5
	p.front_arb_ratio = 0.25 * FD * front_arb_mod
	p.rear_arb_ratio = 0.25 * FD * rear_arb_mod
	
	p.front_tire_radius = radius
	p.rear_tire_radius = radius
	p.front_tire_width = width
	p.rear_tire_width = width

	p.braking_grip_multiplier = 2.0 if usage == 1 else 1.5
	var road_cof = [4.0, 5.0, 3.0][usage]
	p.coefficient_of_friction["Road"] = road_cof
	p.coefficient_of_friction["Dirt"] = road_cof * 0.8
	p.coefficient_of_friction["Grass"] = road_cof * 0.6
	var road_stiff = [15000.0, 20000.0, 7000.0][usage]
	p.tire_stiffnesses["Road"] = road_stiff
	p.tire_stiffnesses["Dirt"] = road_stiff * 0.5
	p.tire_stiffnesses["Grass"] = road_stiff * 0.3
	p.longitudinal_grip_ratio["Road"] = 0.8 if usage == 2 else 0.5

	p.throttle_speed = 30.0
	p.steering_speed = 8.0
	p.countersteer_speed = 12.0
	p.steering_speed_decay = 0.05
	p.front_brake_bias = -0.75

	p.traction_control_max_slip = 8.0 if tc_on else 100.0
	p.enable_stability = assist != 0
	p.stability_yaw_strength = [0.0, 1.5, 3.0][assist]
	p.lateral_grip_assist["Road"] = [0.0, 0.05, 0.10][assist]
	p.stability_yaw_engage_angle = 0.05
	p.stability_yaw_ground_multiplier = 3.0
	p.stability_upright_spring = 1.0
	p.stability_upright_damping = 700.0

	p.max_steering_angle = 40.0 * DEG_TO_RAD
	p.braking_speed = 25.0
	p.rear_abs_pulse_time = 0.03
	p.rear_abs_spin_difference_threshold = 12.0
	p.reverse_ratio = 3.3
	p.contact_patch = 0.2
	
	return p

func _generate_preview() -> void:
	var preset = _calculate_full_preset()
	for child in items.get_children():
		if child != template:
			child.queue_free()
	for prop in preset.get_property_list():
		if !(prop.usage & PROPERTY_USAGE_EDITOR) or prop.name.begins_with("_"):
			continue
		var item = template.duplicate()
		item.visible = true
		item.get_node("Title").text = prop.name.replace("_", " ").capitalize()
		var val = preset.get(prop.name)
		if val is Curve:
			item.get_node("Info").text = "Curva de torque (" + str(val.get_point_count()) + " puntos)"
		elif val is Dictionary:
			item.get_node("Info").text = "Dictionary (" + str(val.size()) + ")"
		elif val is Array:
			item.get_node("Info").text = "Array[" + str(val.size()) + "]"
		else:
			item.get_node("Info").text = str(val)
		items.add_child(item)

func _on_create_pressed() -> void:
	var name_text = preset_name.text.strip_edges()
	if name_text.is_empty():
		name_text = "Mi_Vehiculo"
	var preset = _calculate_full_preset()
	
	print("=== PRESET CREADO ===")
	print("Velocidad máxima:", target_top_speed_kmh.text, "km/h")
	print("0-100 km/h:", zero_to_hundred_time.text, "s")
	print("Masa:", preset.vehicle_mass, "kg")
	print("Par máximo:", preset.max_torque, "Nm")
	print("Final drive:", preset.final_drive)
	print("Relaciones:", preset.gear_ratios)
	
	var path = "res://VehiclePresets/" + name_text.replace(" ", "_") + ".tres"
	if not DirAccess.dir_exists_absolute("res://VehiclePresets"):
		DirAccess.make_dir_absolute("res://VehiclePresets")
	ResourceSaver.save(preset, path)
	print("Guardado en:", path)
	get_tree().quit()
