extends Node
class_name VehicleDebugFXController

@export_group("Debug control")
## [b][img width=8]res://Assets/UI/EU.png[/img] Vehicle Node Reference[/b]
## The main [Vehicle] node being monitored by this debug script. [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Referencia al Nodo Vehículo
## El nodo principal [Vehicle] que es monitoreado por este script de depuración.
@export var vehicle_node: Vehicle
## [b][img width=8]res://Assets/UI/EU.png[/img] Enable Debug Drawing[/b]
## If true, enables all visual debug elements (arrows, spheres, boxes) in the 3D viewport.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Habilitar Dibujo de Depuración
## Si es true, habilita todos los elementos visuales de depuración (flechas, esferas, cajas) en la ventana 3D.
@export var show_debug: bool = false


@export_group("Wheel Visuals")
## [b][img width=8]res://Assets/UI/EU.png[/img] Show Wheel Sphere Visual[/b]
## If true, draws a colored sphere representing the wheel's collision radius at the contact point.  [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Mostrar Visual de Esfera de Rueda
## Si es true, dibuja una esfera de color que representa el radio de colisión de la rueda en el punto de contacto.
@export var show_wheel_sphere: bool = true
## [b][img width=8]res://Assets/UI/EU.png[/img] Show Suspension Box Visual[/b]
## If true, draws a colored box representing the length and position of the suspension spring/raycast.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Mostrar Visual de Caja de Suspensión
## Si es true, dibuja una caja de color que representa la longitud y posición del muelle/raycast de suspensión.
@export var show_suspension_box: bool = true
## [b][img width=8]res://Assets/UI/EU.png[/img] Wheel Sphere Color[/b]
## The color used for the wheel sphere debug visual.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Color de la Esfera de Rueda
## El color utilizado para el visual de depuración de la esfera de la rueda.
@export var wheel_sphere_color: Color = Color("f55505ff")
## [b][img width=8]res://Assets/UI/EU.png[/img] Wheel Sphere Radius Multiplier[/b]
## Multiplier applied to the wheel's tire radius when drawing the debug sphere. Use to visualize the size accurately.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Multiplicador del Radio de la Esfera de Rueda
## Multiplicador aplicado al radio del neumático de la rueda al dibujar la esfera de depuración. Se usa para visualizar el tamaño con precisión.
@export var wheel_sphere_radius_multiplier: float = 1.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Suspension Box Color[/b]
## The color used for the suspension box debug visual.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Color de la Caja de Suspensión
## El color utilizado para el visual de depuración de la caja de suspensión.
@export var suspension_box_color: Color = Color("05f53dff")
## [b][img width=8]res://Assets/UI/EU.png[/img] Suspension Box Thickness[/b]
## The thickness (X and Z size) of the suspension box visual.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Grosor de la Caja de Suspensión
## El grosor (tamaño en X y Z) del visual de la caja de suspensión.
@export var suspension_box_thickness: float = 0.5

@export_subgroup("Velocity Arrow")
## [b][img width=8]res://Assets/UI/EU.png[/img] Show Velocity Vector Arrow[/b]
## If true, draws an arrow indicating the vehicle's linear velocity vector. [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Mostrar Flecha del Vector de Velocidad
## Si es true, dibuja una flecha que indica el vector de velocidad lineal del vehículo.
@export var show_vel_arrow: bool = true
## [b][img width=8]res://Assets/UI/EU.png[/img] Velocity Arrow Length Multiplier[/b]
## Multiplier for the arrow's length, typically proportional to the velocity magnitude. [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Multiplicador de Longitud de Flecha de Velocidad
## Multiplicador para la longitud de la flecha, típicamente proporcional a la magnitud de la velocidad.
@export var vel_arrow_length : float = 0.5
## [b][img width=8]res://Assets/UI/EU.png[/img] Velocity Arrow Thickness[/b]
## The thickness/size of the arrow's head and body. [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Grosor de la Flecha de Velocidad
## El grosor/tamaño de la cabeza y el cuerpo de la flecha.
@export var vel_arrow_size : float = 0.05
## [b][img width=8]res://Assets/UI/EU.png[/img] Velocity Arrow Color[/b]
## The color used for the velocity arrow. [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Color de la Flecha de Velocidad
## El color utilizado para la flecha de velocidad.
@export var vel_arrow_color : Color = Color("f5056dff")

@export_subgroup("Suspension Force Arrow")
## [b][img width=8]res://Assets/UI/EU.png[/img] Show Suspension Force Arrow[/b]
## If true, draws an arrow indicating the force applied by the suspension spring at the contact point.  [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Mostrar Flecha de Fuerza de Suspensión
## Si es true, dibuja una flecha que indica la fuerza aplicada por el muelle de suspensión en el punto de contacto.
@export var show_suspension_force_arrow: bool = true
## [b][img width=8]res://Assets/UI/EU.png[/img] Suspension Force Arrow Length Multiplier[/b]
## Multiplier for the arrow's length, typically proportional to the suspension force magnitude. [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Multiplicador de Longitud de Flecha de Fuerza de Suspensión
## Multiplicador para la longitud de la flecha, típicamente proporcional a la magnitud de la fuerza de suspensión.
@export var suspension_force_arrow_length : float = 0.5
## [b][img width=8]res://Assets/UI/EU.png[/img] Suspension Force Arrow Thickness[/b]
## The thickness/size of the suspension force arrow. [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Grosor de la Flecha de Fuerza de Suspensión
## El grosor/tamaño de la flecha de fuerza de suspensión.
@export var suspension_force_arrow_size : float = 0.05
## [b][img width=8]res://Assets/UI/EU.png[/img] Suspension Force Arrow Color[/b]
## The color used for the suspension force arrow. [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Color de la Flecha de Fuerza de Suspensión
## El color utilizado para la flecha de fuerza de suspensión.
@export var suspension_force_arrow_color : Color = Color("055df5ff")

@export_subgroup("Lateral Grip Force Arrow")
## [b][img width=8]res://Assets/UI/EU.png[/img] Show Lateral Grip Force Arrow[/b]
## If true, draws an arrow indicating the lateral (sideways) grip force acting on the wheel. [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Mostrar Flecha de Fuerza de Agarre Lateral
## Si es true, dibuja una flecha que indica la fuerza de agarre lateral (hacia los lados) actuando sobre la rueda.
@export var show_lateral_grip_force_arrow: bool = true
## [b][img width=8]res://Assets/UI/EU.png[/img] Lateral Grip Force Arrow Length Multiplier[/b]
## Multiplier for the arrow's length, typically proportional to the lateral grip force magnitude. [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Multiplicador de Longitud de Flecha de Fuerza de Agarre Lateral
## Multiplicador para la longitud de la flecha, típicamente proporcional a la magnitud de la fuerza de agarre lateral.
@export var lateral_grip_force_arrow_length : float = 0.5
## [b][img width=8]res://Assets/UI/EU.png[/img] Lateral Grip Force Arrow Thickness[/b]
## The thickness/size of the lateral grip force arrow. [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Grosor de la Flecha de Fuerza de Agarre Lateral
## El grosor/tamaño de la flecha de fuerza de agarre lateral.
@export var lateral_grip_force_arrow_size : float = 0.05
## [b][img width=8]res://Assets/UI/EU.png[/img] Lateral Grip Force Arrow Color[/b]
## The color used for the lateral grip force arrow. [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Color de la Flecha de Fuerza de Agarre Lateral
## El color utilizado para la flecha de fuerza de agarre lateral.
@export var lateral_grip_force_arrow_color : Color = Color("7905f5ff")

@export_subgroup("Longitudinal Force Arrow")
## [b][img width=8]res://Assets/UI/EU.png[/img] Show Longitudinal Force Arrow[/b]
## If true, draws an arrow indicating the longitudinal (forward/backward) force acting on the wheel (traction/braking).  [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Mostrar Flecha de Fuerza Longitudinal
## Si es true, dibuja una flecha que indica la fuerza longitudinal (avance/retroceso) actuando sobre la rueda (tracción/frenado).
@export var show_longitudinal_force_arrow: bool = true
## [b][img width=8]res://Assets/UI/EU.png[/img] Longitudinal Force Arrow Length Multiplier[/b]
## Multiplier for the arrow's length, typically proportional to the longitudinal force magnitude. [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Multiplicador de Longitud de Flecha de Fuerza Longitudinal
## Multiplicador para la longitud de la flecha, típicamente proporcional a la magnitud de la fuerza longitudinal.
@export var longitudinal_force_arrow_length : float = 0.5
## [b][img width=8]res://Assets/UI/EU.png[/img] Longitudinal Force Arrow Thickness[/b]
## The thickness/size of the longitudinal force arrow. [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Grosor de la Flecha de Fuerza Longitudinal
## El grosor/tamaño de la flecha de fuerza longitudinal.
@export var longitudinal_force_arrow_size : float = 0.05
## [b][img width=8]res://Assets/UI/EU.png[/img] Longitudinal Force Arrow Color[/b]
## The color used for the longitudinal force arrow. [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Color de la Flecha de Fuerza Longitudinal
## El color utilizado para la flecha de fuerza longitudinal.
@export var longitudinal_force_arrow_color : Color = Color("00fff2ff")

@onready var rpm: Label = %RPM
@onready var speed: Label = %Speed
@onready var transmission: Label = %Transmission
@onready var gear: Label = %Gear
@onready var steering: TextureRect = %Steering

# NO usar duration - dejar que DebugDraw3D maneje la persistencia automáticamente
const DEBUG_DRAW_DURATION: float = 0.0

func _ready():
	# Asegurar que se procese solo en _process, no en _physics_process
	set_physics_process(false)
	set_process(true)

func _update_ui() -> void:
	if not is_instance_valid(vehicle_node):
		rpm.text = ""
		speed.text = ""
		transmission.text = ""
		gear.text = ""
		steering.rotation_degrees = 0.0
		return
		
	rpm.text = "%d" % int(vehicle_node.motor_rpm)
	var current_speed = vehicle_node.speed * 3.6
	speed.text = "%.1f" % current_speed
	
	if vehicle_node.automatic_transmission:
		transmission.text = "A" 
	else:
		transmission.text = "M"
	
	var current_gear = vehicle_node.current_gear
	var gear_text = ""
	if current_gear == 0:
		gear_text = "N"
	elif current_gear < 0:
		gear_text = "R"
	else:
		gear_text = str(current_gear)
	gear.text = gear_text
	
	var steer_angle = vehicle_node.true_steering_amount
	var max_steer_angle = vehicle_node.max_steering_angle 
	if max_steer_angle > 0.001:
		var normalized_steering = steer_angle / max_steer_angle
		var rotation_degrees = normalized_steering * -180.0 
		steering.rotation_degrees = rotation_degrees
	else:
		steering.rotation_degrees = 0.0

func _process(_delta: float) -> void:
	_update_ui() 
	
	if not show_debug or not is_instance_valid(vehicle_node):
		return
	
	if not Engine.has_singleton("DebugDraw3D"):
		return
	
	var dd = DebugDraw3D
	
	# Usar scoped config para limpieza automática por frame
	var _scoped = dd.scoped_config()
	
	# Dibujar flecha de velocidad
	if show_vel_arrow:
		_draw_velocity_arrow(dd)
	
	# Dibujar debug de todas las ruedas
	var all_wheels = _get_all_wheels()
	for wheel in all_wheels:
		if is_instance_valid(wheel) and wheel.is_colliding():
			_draw_wheel_forces(dd, wheel)
			_draw_wheel_visuals(dd, wheel)

func _get_all_wheels() -> Array:
	var wheels: Array = []
	
	# Ruedas principales
	if is_instance_valid(vehicle_node.front_left_wheel): 
		wheels.append(vehicle_node.front_left_wheel)
	if is_instance_valid(vehicle_node.front_right_wheel): 
		wheels.append(vehicle_node.front_right_wheel)
	if is_instance_valid(vehicle_node.rear_left_wheel): 
		wheels.append(vehicle_node.rear_left_wheel)
	if is_instance_valid(vehicle_node.rear_right_wheel): 
		wheels.append(vehicle_node.rear_right_wheel)
	
	# Ruedas extra 
	if vehicle_node.extra_wheels:
		wheels.append_array(vehicle_node.extra_wheels.filter(func(w): return is_instance_valid(w)))
		
	return wheels

func _draw_velocity_arrow(dd) -> void:
	var origin = vehicle_node.global_position
	var velocity = vehicle_node.linear_velocity
	var direction = velocity.normalized()
	var length = velocity.length() * vel_arrow_length
	
	if length > 0.01:
		dd.draw_arrow_ray(
			origin, 
			direction, 
			length, 
			vel_arrow_color, 
			vel_arrow_size, 
			false, 
			DEBUG_DRAW_DURATION  # CRITICAL: Duration > 0
		)

func _draw_wheel_forces(dd, wheel: Wheel) -> void:
	if not wheel.has_method("get_collision_point") or not wheel.is_colliding():
		return
	
	var contact_point = wheel.get_collision_point()
	var normal = wheel.last_collision_normal
	var car_mass = vehicle_node.mass
	if car_mass == 0.0: 
		car_mass = 1.0 
	
	var vertical_origin = contact_point
	var horizontal_origin = contact_point + normal * (wheel.tire_radius / 2.0)
	
	# Fuerza de suspensión
	if show_suspension_force_arrow:
		var suspension_force = wheel.suspension_force 
		if suspension_force.length_squared() > 0.0:
			var direction = suspension_force.normalized()
			var length = (suspension_force.length() / car_mass) * suspension_force_arrow_length
			dd.draw_arrow_ray(
				vertical_origin, 
				direction, 
				length, 
				suspension_force_arrow_color, 
				suspension_force_arrow_size, 
				false, 
				DEBUG_DRAW_DURATION
			)
	
	# Fuerza lateral
	if show_lateral_grip_force_arrow:
		var lateral_force = wheel.lateral_force 
		if lateral_force.length_squared() > 0.0:
			var direction = lateral_force.normalized()
			var length = (lateral_force.length() / car_mass) * lateral_grip_force_arrow_length
			dd.draw_arrow_ray(
				horizontal_origin, 
				direction, 
				length, 
				lateral_grip_force_arrow_color, 
				lateral_grip_force_arrow_size, 
				false, 
				DEBUG_DRAW_DURATION
			)
	
	# Fuerza longitudinal
	if show_longitudinal_force_arrow:
		var longitudinal_force = wheel.longitudinal_force 
		if longitudinal_force.length_squared() > 0.0:
			var direction = longitudinal_force.normalized()
			var length = (longitudinal_force.length() / car_mass) * longitudinal_force_arrow_length
			dd.draw_arrow_ray(
				horizontal_origin, 
				direction, 
				length, 
				longitudinal_force_arrow_color, 
				longitudinal_force_arrow_size, 
				false, 
				DEBUG_DRAW_DURATION
			)

func _draw_wheel_visuals(dd, wheel: Wheel) -> void:
	if not is_instance_valid(wheel) or not wheel.is_colliding():
		return
		
	var ray_origin = wheel.global_position
	var contact_point = wheel.get_collision_point() 
	var normal = wheel.last_collision_normal
	
	# Esfera de rueda
	if show_wheel_sphere:
		var sphere_radius = wheel.tire_radius * wheel_sphere_radius_multiplier
		var wheel_center = contact_point + normal * sphere_radius
		dd.draw_sphere(
			wheel_center, 
			sphere_radius, 
			wheel_sphere_color, 
			DEBUG_DRAW_DURATION
		)
	
	# Caja de suspensión
	if show_suspension_box:
		var suspension_length = ray_origin.distance_to(contact_point) 
		if suspension_length < 0.001:
			return
		
		var suspension_center = (ray_origin + contact_point) / 2.0
		var box_size = Vector3(suspension_box_thickness, suspension_length, suspension_box_thickness) 
		var box_rotation = wheel.global_transform.basis.get_rotation_quaternion()
		
		dd.draw_box(
			suspension_center, 
			box_rotation, 
			box_size, 
			suspension_box_color, 
			true, 
			DEBUG_DRAW_DURATION
		)
