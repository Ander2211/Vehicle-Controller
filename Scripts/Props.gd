extends Node3D

const CONE_1 = preload("uid://b7lh1k04k855o")

@export_category("Track Dimensions")
@export var track_width: float = 15.0
@export var cone_separation: float = 4.0

@export_category("Circuit Layout")
@export_enum("Oval", "Rectangle", "L-Shape", "Figure 8") var circuit_type: int = 0
@export var straight_length: float = 150.0
@export var curve_radius: float = 20.0

@export_category("Cone Placement")
@export_enum("Both Sides", "Alternating", "Left Only", "Right Only") var cone_mode: int = 0

@export_category("Auto Reset")
@export var auto_reset_enabled: bool = true
@export var reset_check_interval: float = 2.0
@export var fallen_angle_threshold: float = 45.0

@export_category("Track Entrance")
@export var add_entrance: bool = true
@export var entrance_length: float = 15.0

@export_category("Vehicle Spawn")
@export var vehicle: RigidBody3D = null
@export var spawn_vehicle_at_start: bool = true

# Variables internas
var spawned_cones: Array[Node3D] = []
var cone_original_transforms: Dictionary = {}
var reset_timer: float = 0.0
var start_position: Vector3 = Vector3.ZERO
var start_direction: Vector3 = Vector3.FORWARD

func _ready():
	_generate_circuit()
	if spawn_vehicle_at_start and vehicle:
		_position_vehicle()

func _process(delta: float):
	if auto_reset_enabled:
		reset_timer += delta
		if reset_timer >= reset_check_interval:
			reset_timer = 0.0
			_check_and_reset_fallen_cones()

func _generate_circuit():
	"""Genera el circuito cerrado según el tipo seleccionado"""
	clear_track()
	
	match circuit_type:
		0: _generate_oval()
		1: _generate_rectangle()
		2: _generate_l_shape()
		3: _generate_figure_8()


func _generate_oval():
	"""Circuito ovalado (2 rectas + 2 curvas de 180°)"""
	var points: PackedVector3Array = []
	var half_width = track_width / 2.0
	
	# Entrada
	var entrance_start = Vector3(-entrance_length, 0, 0)
	if add_entrance:
		_add_straight_points(points, entrance_start, Vector3.RIGHT, entrance_length)
		start_position = global_position + entrance_start - Vector3(2, 0, 0)
		start_direction = Vector3.FORWARD  # Apunta hacia +Z
	else:
		start_position = global_position + Vector3(-5, 0, 0)
		start_direction = Vector3.FORWARD
	
	# Recta inferior
	_add_straight_points(points, Vector3.ZERO, Vector3.RIGHT, straight_length)
	
	# Curva derecha (180°)
	var curve_center = Vector3(straight_length, 0, curve_radius)
	_add_curve_points(points, curve_center, -PI/2, PI/2, curve_radius)
	
	# Recta superior (hacia atrás)
	_add_straight_points(points, Vector3(straight_length, 0, curve_radius * 2.0), Vector3.LEFT, straight_length)
	
	# Curva izquierda (180°)
	var curve_center2 = Vector3(0, 0, curve_radius)
	_add_curve_points(points, curve_center2, PI/2, PI * 1.5, curve_radius)
	
	_place_cones_on_path(points)

func _generate_rectangle():
	"""Circuito rectangular (4 rectas + 4 curvas de 90°)"""
	var points: PackedVector3Array = []
	var width = straight_length
	var height = straight_length * 0.6
	
	# Entrada
	var entrance_start = Vector3(-entrance_length, 0, 0)
	if add_entrance:
		_add_straight_points(points, entrance_start, Vector3.RIGHT, entrance_length)
		start_position = global_position + entrance_start - Vector3(2, 0, 0)
		start_direction = Vector3.FORWARD
	else:
		start_position = global_position + Vector3(-5, 0, 0)
		start_direction = Vector3.FORWARD
	
	# Recta inferior
	_add_straight_points(points, Vector3.ZERO, Vector3.RIGHT, width)
	
	# Curva 1 (90°)
	_add_curve_points(points, Vector3(width, 0, curve_radius), -PI/2, 0, curve_radius)
	
	# Recta derecha
	_add_straight_points(points, Vector3(width + curve_radius, 0, curve_radius), Vector3.FORWARD, height)
	
	# Curva 2 (90°)
	_add_curve_points(points, Vector3(width, 0, curve_radius + height), 0, PI/2, curve_radius)
	
	# Recta superior
	_add_straight_points(points, Vector3(width, 0, curve_radius * 2 + height), Vector3.LEFT, width)
	
	# Curva 3 (90°)
	_add_curve_points(points, Vector3(0, 0, curve_radius + height), PI/2, PI, curve_radius)
	
	# Recta izquierda
	_add_straight_points(points, Vector3(-curve_radius, 0, curve_radius), Vector3.BACK, height)
	
	# Curva 4 (90°)
	_add_curve_points(points, Vector3(0, 0, curve_radius), PI, PI * 1.5, curve_radius)
	
	_place_cones_on_path(points)

func _generate_l_shape():
	"""Circuito en forma de L cerrado"""
	var points: PackedVector3Array = []
	var long_side = straight_length * 1.2
	var short_side = straight_length * 0.7
	
	# Entrada
	var entrance_start = Vector3(-entrance_length, 0, 0)
	if add_entrance:
		_add_straight_points(points, entrance_start, Vector3.RIGHT, entrance_length)
		start_position = global_position + entrance_start - Vector3(2, 0, 0)
		start_direction = Vector3.FORWARD
	else:
		start_position = global_position + Vector3(-5, 0, 0)
		start_direction = Vector3.FORWARD
	
	# Recta horizontal larga
	_add_straight_points(points, Vector3.ZERO, Vector3.RIGHT, long_side)
	
	# Curva externa 90°
	_add_curve_points(points, Vector3(long_side, 0, curve_radius), -PI/2, 0, curve_radius)
	
	# Recta vertical
	_add_straight_points(points, Vector3(long_side + curve_radius, 0, curve_radius), Vector3.FORWARD, short_side)
	
	# Curva externa 90°
	_add_curve_points(points, Vector3(long_side, 0, curve_radius + short_side), 0, PI/2, curve_radius)
	
	# Recta de retorno hacia dentro
	_add_straight_points(points, Vector3(long_side, 0, curve_radius * 2 + short_side), Vector3.LEFT, long_side - track_width)
	
	# Curva interna 90°
	var inner_radius = curve_radius * 0.5
	_add_curve_points(points, Vector3(track_width, 0, curve_radius + short_side), PI/2, PI, inner_radius)
	
	# Recta vertical de retorno
	_add_straight_points(points, Vector3(track_width - inner_radius, 0, curve_radius + short_side - inner_radius), Vector3.BACK, short_side - track_width)
	
	# Curva de cierre 90°
	_add_curve_points(points, Vector3(track_width, 0, track_width), PI, PI * 1.5, inner_radius)
	
	# Recta de cierre
	_add_straight_points(points, Vector3(track_width - inner_radius, 0, track_width - inner_radius), Vector3.LEFT, track_width - inner_radius)
	
	_place_cones_on_path(points)

func _generate_figure_8():
	"""Circuito en forma de 8"""
	var points: PackedVector3Array = []
	var r = curve_radius
	var samples = int((TAU * r) / cone_separation)
	
	# Círculo inferior
	for i in range(samples):
		var angle = (float(i) / float(samples)) * TAU
		var x = r * cos(angle)
		var z = r * sin(angle)
		points.append(Vector3(x, 0, z))
	
	# Círculo superior
	for i in range(samples):
		var angle = (float(i) / float(samples)) * TAU
		var x = r * cos(angle)
		var z = r * sin(angle) + r * 2.5
		points.append(Vector3(x, 0, z))
	
	start_position = global_position + Vector3(-r - 5, 0, 0)
	start_direction = Vector3.FORWARD
	
	_place_cones_on_path(points)

func _add_straight_points(points: PackedVector3Array, start: Vector3, direction: Vector3, length: float):
	"""Agrega puntos de una recta"""
	var steps = max(1, int(length / cone_separation))
	for i in range(steps):
		points.append(start + direction * (i * cone_separation))

func _add_curve_points(points: PackedVector3Array, center: Vector3, start_angle: float, end_angle: float, radius: float):
	"""Agrega puntos de una curva"""
	var arc_length = abs(end_angle - start_angle) * radius
	var steps = max(2, int(arc_length / cone_separation))
	
	for i in range(steps):
		var t = float(i) / float(steps)
		var angle = lerp(start_angle, end_angle, t)
		var offset = Vector3(cos(angle) * radius, 0, sin(angle) * radius)
		points.append(center + offset)

func _place_cones_on_path(points: PackedVector3Array):
	"""Coloca conos a lo largo del path generado"""
	if points.size() < 2:
		return
	
	var half_width = track_width / 2.0
	
	for i in range(points.size()):
		var current = points[i]
		var next = points[(i + 1) % points.size()]
		var forward = (next - current).normalized()
		
		if forward.length_squared() < 0.01:
			forward = Vector3.RIGHT
		
		var right = forward.cross(Vector3.UP).normalized()
		
		match cone_mode:
			0:  # Both Sides
				_spawn_cone(global_position + current + (right * half_width))
				_spawn_cone(global_position + current - (right * half_width))
			1:  # Alternating
				var side = 1.0 if (i % 2 == 0) else -1.0
				_spawn_cone(global_position + current + (right * half_width * side))
			2:  # Left Only
				_spawn_cone(global_position + current - (right * half_width))
			3:  # Right Only
				_spawn_cone(global_position + current + (right * half_width))

func _spawn_cone(pos: Vector3):
	"""Instancia un cono"""
	var cone = CONE_1.instantiate()
	add_child(cone)
	cone.global_position = pos
	spawned_cones.append(cone)
	
	cone_original_transforms[cone] = {
		"position": cone.global_position,
		"rotation": cone.global_rotation
	}

func _position_vehicle():

	if not vehicle:
		return
	
	vehicle.global_position = start_position

	var target_angle = atan2(start_direction.x, -start_direction.z)
	vehicle.global_rotation.y = target_angle
	
	# Resetear velocidades
	vehicle.linear_velocity = Vector3.ZERO
	vehicle.angular_velocity = Vector3.ZERO

func _check_and_reset_fallen_cones():
	"""Verifica y resetea conos caídos"""
	for cone in spawned_cones:
		if not is_instance_valid(cone):
			continue
		
		var up_dot = cone.global_transform.basis.y.dot(Vector3.UP)
		var angle = rad_to_deg(acos(clamp(up_dot, -1.0, 1.0)))
		
		if angle > fallen_angle_threshold:
			_reset_cone(cone)

func _reset_cone(cone: Node3D):
	"""Resetea un cono a su posición original"""
	if cone_original_transforms.has(cone):
		var original = cone_original_transforms[cone]
		cone.global_position = original.position
		cone.global_rotation = original.rotation
		
		if cone is RigidBody3D:
			cone.linear_velocity = Vector3.ZERO
			cone.angular_velocity = Vector3.ZERO

func reset_all_cones():
	"""Resetea todos los conos manualmente"""
	for cone in spawned_cones:
		if is_instance_valid(cone):
			_reset_cone(cone)

func reset_vehicle():
	"""Resetea el vehículo a la posición inicial"""
	_position_vehicle()

func clear_track():
	"""Limpia todos los conos"""
	for cone in spawned_cones:
		if is_instance_valid(cone):
			cone.queue_free()
	spawned_cones.clear()
	cone_original_transforms.clear()
