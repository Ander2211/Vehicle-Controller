extends Node
class_name VehicleInputController

@export_group("Vehicle Node")
## [b][img width=8]res://Assets/UI/EU.png[/img] Vehicle Node Reference[/b]
## The main [Vehicle] node that this script will control. Ensure this node has the 'Vehicle' class name or required functions.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Referencia al Nodo Vehículo
## El nodo principal [Vehicle] que este script controlará. Asegúrate de que este nodo tenga el nombre de clase 'Vehicle' o las funciones requeridas.
@export var vehicle_node: Vehicle

@export_group("Input Maps", "string_")
## [b][img width=8]res://Assets/UI/EU.png[/img] Brake Input Action[/b]
## The name of the input map action used for braking/reverse throttle.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Acción de Entrada de Freno
## El nombre de la acción en el mapa de entrada utilizada para frenar/acelerar en reversa.
@export var string_brake_input: String = "Brake"
## [b][img width=8]res://Assets/UI/EU.png[/img] Steer Left Input Action[/b]
## The name of the input map action used for steering left.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Acción de Dirección a la Izquierda
## El nombre de la acción en el mapa de entrada utilizada para girar a la izquierda.
@export var string_steer_left: String = "Steer Left"
## [b][img width=8]res://Assets/UI/EU.png[/img] Steer Right Input Action[/b]
## The name of the input map action used for steering right.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Acción de Dirección a la Derecha
## El nombre de la acción en el mapa de entrada utilizada para girar a la derecha.
@export var string_steer_right: String = "Steer Right"
## [b][img width=8]res://Assets/UI/EU.png[/img] Throttle Input Action[/b]
## The name of the input map action used for throttle/acceleration.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Acción de Entrada del Acelerador
## El nombre de la acción en el mapa de entrada utilizada para el acelerador/aceleración.
@export var string_throttle_input: String = "Throttle"
## [b][img width=8]res://Assets/UI/EU.png[/img] Handbrake Input Action[/b]
## The name of the input map action used for the handbrake/e-brake.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Acción de Entrada del Freno de Mano
## El nombre de la acción en el mapa de entrada utilizada para el freno de mano/freno de emergencia.
@export var string_handbrake_input: String = "Handbrake"
## [b][img width=8]res://Assets/UI/EU.png[/img] Clutch Input Action[/b]
## The name of the input map action used for the clutch pedal.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Acción de Entrada del Embrague
## El nombre de la acción en el mapa de entrada utilizada para el pedal del embrague.
@export var string_clutch_input: String = "Clutch"
## [b][img width=8]res://Assets/UI/EU.png[/img] Toggle Transmission Action[/b]
## The name of the input map action used to switch between Automatic/Manual transmission.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Acción de Alternar Transmisión
## El nombre de la acción en el mapa de entrada utilizada para cambiar entre transmisión Automática/Manual.
@export var string_toggle_transmission: String = "Toggle Transmission"
## [b][img width=8]res://Assets/UI/EU.png[/img] Shift Up Action[/b]
## The name of the input map action used for manual gear shifting up.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Acción de Cambio Ascendente
## El nombre de la acción en el mapa de entrada utilizada para el cambio manual de marcha ascendente.
@export var string_shift_up: String = "Shift Up"
## [b][img width=8]res://Assets/UI/EU.png[/img] Shift Down Action[/b]
## The name of the input map action used for manual gear shifting down.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Acción de Cambio Descendente
## El nombre de la acción en el mapa de entrada utilizada para el cambio manual de marcha descendente.
@export var string_shift_down: String = "Shift Down"
## [b][img width=8]res://Assets/UI/EU.png[/img] Engine Toggle Action[/b]
## The name of the input map action used to turn the engine on or off.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Acción de Alternar Motor
## El nombre de la acción en el mapa de entrada utilizada para encender o apagar el motor.
@export var string_engine_toggle: String = "Engine"

@export_subgroup("Extra Features", "string_")
## [b][img width=8]res://Assets/UI/EU.png[/img] Nitro Input Action[/b]
## The name of the input map action used to activate the nitro boost feature (if available on the vehicle). [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Acción de Entrada de Nitro
## El nombre de la acción en el mapa de entrada utilizada para activar la función de impulso nitro (si está disponible en el vehículo).
@export var string_nitro_input: String = "Nitro"
## [b][img width=8]res://Assets/UI/EU.png[/img] Speedbreaker Input Action[/b]
## The name of the input map action used to activate the speedbreaker/bullet-time feature (if available on the vehicle). [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Acción de Entrada de Speedbreaker
## El nombre de la acción en el mapa de entrada utilizada para activar la función de speedbreaker/tiempo bala (si está disponible en el vehículo).
@export var string_speedbreaker_input: String = "Speedbreaker"

@export_subgroup("Lights", "string_")
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Lights Toggle Action[/b]
## The name of the input map action used to toggle the front/head lights.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Acción de Alternar Luces Delanteras
## El nombre de la acción en el mapa de entrada utilizada para encender/apagar las luces delanteras/faros.
@export var string_front_light_input: String = "Front Lights"
## [b][img width=8]res://Assets/UI/EU.png[/img] Turn Left Signal Action[/b]
## The name of the input map action used to activate the left turn signal.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Acción de Señal de Giro Izquierda
## El nombre de la acción en el mapa de entrada utilizada para activar la señal de giro izquierda.
@export var string_turn_left_light_input: String = "Turn Signal Left"
## [b][img width=8]res://Assets/UI/EU.png[/img] Turn Right Signal Action[/b]
## The name of the input map action used to activate the right turn signal.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Acción de Señal de Giro Derecha
## El nombre de la acción en el mapa de entrada utilizada para activar la señal de giro derecha.
@export var string_turn_right_light_input: String = "Turn Signal Right"

@export_group("Engine Start Delay", "engine_")
## [b][img width=8]res://Assets/UI/EU.png[/img] Engine Start-up Delay[/b]
## The time (in seconds) the engine takes to start when toggled on, allowing for a realistic start-up sound effect.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Retraso de Encendido del Motor
## El tiempo (en segundos) que tarda el motor en encenderse al ser activado, permitiendo un efecto de sonido de arranque realista.
@export var engine_start_delay: float = 1.5

var engine_start_timer: float = 0.0
var is_starting_engine: bool = false
var front_lights_on: bool = true
var turn_left_active: bool = false
var turn_right_active: bool = false

signal engine_state_changed(running: bool, starting: bool)
signal brake_state_changed(braking: bool)
signal reverse_state_changed(reversing: bool)
signal nitro_state_changed(active: bool)
signal movement_state_changed(moving: bool)
signal front_lights_toggled(on: bool)
signal turn_signal_state_changed(left: bool, right: bool)

func _ready():
	if not vehicle_node:
		push_error("VehicleInputController: No se asignó vehicle_node!")
		set_physics_process(false)
		return
		
	front_lights_toggled.emit(front_lights_on)

func _physics_process(delta):
	if not vehicle_node:
		return

	_handle_engine_start_delay(delta)
	_read_basic_inputs()
	_read_special_inputs()
	_update_reverse_logic()
	_emit_visual_signals()

func _handle_engine_start_delay(delta):
	if is_starting_engine:
		engine_start_timer -= delta
		if engine_start_timer <= 0.0:
			vehicle_node.engine_on = true
			is_starting_engine = false
			engine_state_changed.emit(true, false)

func _read_basic_inputs():
	if string_brake_input != "":
		vehicle_node.brake_input = Input.get_action_strength(string_brake_input)

	if string_steer_left != "" and string_steer_right != "":
		vehicle_node.steering_input = Input.get_action_strength(string_steer_left) - Input.get_action_strength(string_steer_right)

	if string_throttle_input != "":
		vehicle_node.throttle_input = pow(Input.get_action_strength(string_throttle_input), 2.0)

	if string_handbrake_input != "":
		vehicle_node.handbrake_input = Input.get_action_strength(string_handbrake_input)

	if string_clutch_input != "":
		vehicle_node.clutch_input = clampf(
			Input.get_action_strength(string_clutch_input) + Input.get_action_strength(string_handbrake_input), 0.0, 1.0
		)

func _read_special_inputs():
	if string_toggle_transmission != "" and Input.is_action_just_pressed(string_toggle_transmission):
		vehicle_node.automatic_transmission = not vehicle_node.automatic_transmission

	if string_shift_up != "" and Input.is_action_just_pressed(string_shift_up):
		vehicle_node.manual_shift(1)
	if string_shift_down != "" and Input.is_action_just_pressed(string_shift_down):
		vehicle_node.manual_shift(-1)

	if string_engine_toggle != "" and Input.is_action_just_pressed(string_engine_toggle):
		if vehicle_node.engine_on:
			vehicle_node.engine_on = false
			is_starting_engine = false
			engine_state_changed.emit(false, false)
		else:
			if not is_starting_engine:
				is_starting_engine = true
				engine_start_timer = engine_start_delay
				engine_state_changed.emit(false, true)

	if string_nitro_input != "" and is_instance_valid(vehicle_node.extra_features):
		var pressed = Input.is_action_pressed(string_nitro_input)
		vehicle_node.extra_features.nitro_input = 1.0 if pressed else 0.0

	if string_speedbreaker_input != "" and is_instance_valid(vehicle_node.extra_features):
		var pressed = Input.is_action_pressed(string_speedbreaker_input)
		vehicle_node.extra_features.speedbreaker_input = 1.0 if pressed else 0.0

	if VehicleControl.has_method("set_nitro_recharge") and is_instance_valid(vehicle_node.extra_features):
		VehicleControl.set_nitro_recharge(vehicle_node.extra_features.nitro_level)
		
	if string_front_light_input != "" and Input.is_action_just_pressed(string_front_light_input):
		front_lights_on = not front_lights_on
		front_lights_toggled.emit(front_lights_on)

	var just_pressed_left = Input.is_action_just_pressed(string_turn_left_light_input)
	var just_pressed_right = Input.is_action_just_pressed(string_turn_right_light_input)

	if just_pressed_left and just_pressed_right:

		turn_left_active = not turn_left_active
		turn_right_active = turn_left_active 
		turn_signal_state_changed.emit(turn_left_active, turn_right_active)

	elif just_pressed_left:

		if turn_left_active:
			turn_left_active = false
		else:
			turn_left_active = true
			turn_right_active = false 
			
		turn_signal_state_changed.emit(turn_left_active, turn_right_active)

	elif just_pressed_right:

		if turn_right_active:
			turn_right_active = false
		else:
			turn_right_active = true
			turn_left_active = false 
			
		turn_signal_state_changed.emit(turn_left_active, turn_right_active)

func _update_reverse_logic():

	if vehicle_node.current_gear == -1:
		vehicle_node.brake_input = Input.get_action_strength(string_throttle_input)
		vehicle_node.throttle_input = Input.get_action_strength(string_brake_input)

func _emit_visual_signals():
	var engine_running = vehicle_node.engine_on and not is_starting_engine
	var is_moving = vehicle_node.speed > 3.0
	var is_braking = vehicle_node.brake_input > 0.1 or vehicle_node.handbrake_input > 0.1
	var is_reversing = vehicle_node.current_gear == -1
	
	var is_nitro_active = false

	if is_instance_valid(vehicle_node.extra_features):
		is_nitro_active = vehicle_node.extra_features.nitro_active and engine_running

	engine_state_changed.emit(engine_running, is_starting_engine)
	brake_state_changed.emit(is_braking and engine_running)
	reverse_state_changed.emit(is_reversing and engine_running)
	nitro_state_changed.emit(is_nitro_active)
	movement_state_changed.emit(is_moving and engine_running)
