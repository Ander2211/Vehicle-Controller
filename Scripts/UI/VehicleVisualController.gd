extends Node
class_name VehicleVisualFXController

@export_group("Node References")
## [b][img width=8]res://Assets/UI/EU.png[/img] Vehicle Node Reference[/b]
## The main [Vehicle] node whose data (e.g., speed, brake input) is used to control the effects.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Referencia al Nodo Vehículo
## El nodo principal [Vehicle] cuyos datos (ej. velocidad, entrada de freno) se utilizan para controlar los efectos.
@export var vehicle_node: Vehicle
## [b][img width=8]res://Assets/UI/EU.png[/img] Input Controller Reference[/b]
## The [VehicleInputController] node used to get input status (e.g., turn signals, brake) for sound logic.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Referencia al Controlador de Entrada
## El nodo [VehicleInputController] utilizado para obtener el estado de la entrada (ej. señales de giro, freno) para la lógica de sonido.
@export var input_controller: VehicleInputController

@export_group("Brake & Reverse Lights", "fx_")
## [b][img width=8]res://Assets/UI/EU.png[/img] Brake Lights Array[/b]
## An array of [OmniLight3D] nodes to be activated as brake lights (e.g., rear red lights).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Array de Luces de Freno
## Un array de nodos [OmniLight3D] que se activarán como luces de freno (ej. luces traseras rojas).
@export var fx_brake_lights: Array[OmniLight3D] = []
## [b][img width=8]res://Assets/UI/EU.png[/img] Reverse Lights Array[/b]
## An array of [OmniLight3D] nodes to be activated as reverse lights (e.g., rear white lights).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Array de Luces de Reversa
## Un array de nodos [OmniLight3D] que se activarán como luces de reversa (ej. luces traseras blancas).
@export var fx_reverse_lights: Array[OmniLight3D] = []
## [b][img width=8]res://Assets/UI/EU.png[/img] Brake Light Intensity[/b]
## The light intensity (in lumens) when the brake lights are fully on.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Intensidad de Luces de Freno
## La intensidad de luz (en lúmenes) cuando las luces de freno están completamente encendidas.
@export var fx_brake_intensity: float = 6.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Reverse Light Intensity[/b]
## The light intensity (in lumens) when the reverse lights are fully on.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Intensidad de Luces de Reversa
## La intensidad de luz (en lúmenes) cuando las luces de reversa están completamente encendidas.
@export var fx_reverse_intensity: float = 4.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Brake Light Color[/b]
## The color for the brake lights (usually red).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Color de Luces de Freno
## El color para las luces de freno (normalmente rojo).
@export var fx_brake_color: Color = Color(1.0, 0.1, 0.1)
## [b][img width=8]res://Assets/UI/EU.png[/img] Reverse Light Color[/b]
## The color for the reverse lights (usually white/bright).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Color de Luces de Reversa
## El color para las luces de reversa (normalmente blanco/brillante).
@export var fx_reverse_color: Color = Color(1.0, 1.0,1.0)
## [b][img width=8]res://Assets/UI/EU.png[/img] Light Fade In Speed[/b]
## The speed (per second) at which brake and reverse lights fade in when activated.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Velocidad de Encendido de Luz
## La velocidad (por segundo) a la que las luces de freno y reversa se encienden al ser activadas.
@export var fx_on_speed: float = 30.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Light Fade Out Speed[/b]
## The speed (per second) at which brake and reverse lights fade out when deactivated.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Velocidad de Apagado de Luz
## La velocidad (por segundo) a la que las luces de freno y reversa se apagan al ser desactivadas.
@export var fx_off_speed: float = 15.0

@export_group("Front Lights & Turn Signals", "fx_")
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Lights Array[/b]
## An array of [SpotLight3D] nodes to be activated as front headlights/driving lights.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Array de Luces Delanteras
## Un array de nodos [SpotLight3D] que se activarán como faros delanteros/luces de conducción.
@export var fx_front_lights: Array[SpotLight3D] = []
## [b][img width=8]res://Assets/UI/EU.png[/img] Left Turn Signal Light[/b]
## The [OmniLight3D] node for the left turn signal/blinker.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Luz de Señal de Giro Izquierda
## El nodo [OmniLight3D] para la señal de giro/intermitente izquierda.
@export var fx_turn_signal_left_light: OmniLight3D
## [b][img width=8]res://Assets/UI/EU.png[/img] Right Turn Signal Light[/b]
## The [OmniLight3D] node for the right turn signal/blinker.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Luz de Señal de Giro Derecha
## El nodo [OmniLight3D] para la señal de giro/intermitente derecha.
@export var fx_turn_signal_right_light: OmniLight3D
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Light Intensity[/b]
## The light intensity (in lumens) when the front headlights are fully on.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Intensidad de Luces Delanteras
## La intensidad de luz (en lúmenes) cuando los faros delanteros están completamente encendidos.
@export var fx_front_intensity: float = 12.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Light Fade Speed[/b]
## The speed (per second) at which the front lights fade in/out when toggled.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Velocidad de Fundido de Luz Delantera
## La velocidad (por segundo) a la que las luces delanteras se encienden/apagan gradualmente al ser alternadas.
@export var fx_front_fade_speed: float = 60.0 # Valor ajustado por el usuario
## [b][img width=8]res://Assets/UI/EU.png[/img] Blinker Light Intensity[/b]
## The light intensity (in lumens) when the turn signal lights are on.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Intensidad de Luces Intermitentes
## La intensidad de luz (en lúmenes) cuando las luces de señal de giro están encendidas.
@export var fx_blinker_intensity: float = 3.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Blinker Cycle Time (s)[/b]
## The time (in seconds) for a single cycle (ON or OFF) of the turn signal blinker effect. (e.g., 0.5s ON, 0.5s OFF).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Tiempo de Ciclo de Intermitente (s)
## El tiempo (en segundos) para un solo ciclo (ENCENDIDO o APAGADO) del efecto intermitente de la señal de giro. (ej. 0.5s ENCENDIDO, 0.5s APAGADO).
@export var fx_blinker_cycle_time: float = 0.5 # 0.5 segundos ON, 0.5 segundos OFF

@export_group("Nitro FX")
## [b][img width=8]res://Assets/UI/EU.png[/img] Nitro FX Lights[/b]
## An array of [OmniLight3D] nodes (e.g., undercarriage lights) to activate when nitro is used.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Luces de Efecto Nitro
## Un array de nodos [OmniLight3D] (ej. luces bajas) que se activarán cuando se use el nitro.
@export var nitro_fx_lights: Array[OmniLight3D] = []
## [b][img width=8]res://Assets/UI/EU.png[/img] Nitro GPU Particles[/b]
## An array of [GPUParticles3D] nodes (e.g., engine flames) to emit when nitro is used.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Partículas GPU de Nitro
## Un array de nodos [GPUParticles3D] (ej. llamas de motor) para emitir cuando se usa el nitro.
@export var nitro_GPU_particles: Array[GPUParticles3D] = []
## [b][img width=8]res://Assets/UI/EU.png[/img] Nitro Trails[/b]
## An array of [GPUTrail3D] nodes (e.g., light trails) to activate when nitro is used.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Rastro de Nitro
## Un array de nodos [GPUTrail3D] (ej. rastros de luz) que se activarán cuando se usa el nitro.
@export var nitro_trails: Array[GPUTrail3D] = []
## [b][img width=8]res://Assets/UI/EU.png[/img] Nitro FX Light Intensity[/b]
## The light intensity (in lumens) for the nitro FX lights when fully on.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Intensidad de Luz FX de Nitro
## La intensidad de luz (en lúmenes) para las luces FX de nitro cuando están completamente encendidas.
@export var nitro_fx_intensity: float = 8.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Nitro FX Light Color[/b]
## The color for the nitro FX lights (e.g., blue or red).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Color de Luz FX de Nitro
## El color para las luces FX de nitro (ej. azul o rojo).
@export var nitro_fx_color: Color = Color(1.0, 0.1, 0.1)
## [b][img width=8]res://Assets/UI/EU.png[/img] Nitro FX Fade In Speed[/b]
## The speed (per second) at which nitro FX lights fade in when activated.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Velocidad de Encendido de FX de Nitro
## La velocidad (por segundo) a la que las luces FX de nitro se encienden al ser activadas.
@export var nitro_on_speed: float = 12.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Nitro FX Fade Out Speed[/b]
## The speed (per second) at which nitro FX lights fade out when deactivated.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Velocidad de Apagado de FX de Nitro
## La velocidad (por segundo) a la que las luces FX de nitro se apagan al ser desactivadas.
@export var nitro_off_speed: float = 8.0

@export_group("Dust FX")
## [b][img width=8]res://Assets/UI/EU.png[/img] Dust GPU Particles[/b]
## An array of [GPUParticles3D] nodes to emit dust when the vehicle is moving or slipping on certain surfaces.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Partículas GPU de Polvo
## Un array de nodos [GPUParticles3D] para emitir polvo cuando el vehículo se mueve o derrapa sobre ciertas superficies.
@export var dust_GPU_particles: Array[GPUParticles3D] = []

@export_group("Skid Marks")
## [b][img width=8]res://Assets/UI/EU.png[/img] Skid Marks GPU Particles[/b]
## An array of [GPUParticles3D] nodes used to draw visual skid/tire marks on the road surface.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Partículas GPU de Marcas de Derrape
## Un array de nodos [GPUParticles3D] utilizados para dibujar marcas visuales de derrape/neumáticos en la superficie de la carretera.
@export var skid_marks_GPU_particles: Array[GPUParticles3D] = []

var current_brake: float = 0.0
var current_reverse: float = 0.0
var current_nitro_lights: float = 0.0
var current_front_lights_energy: float = 0.0

var front_lights_active: bool = true
var turn_left_on: bool = false
var turn_right_on: bool = false
var blinker_time: float = 0.0

func _ready():
	if not vehicle_node or not input_controller:	
		push_error("VehicleVisualFXController: Falta vehicle_node o input_controller")
		set_physics_process(false)
		return

	_setup_omni_lights(fx_brake_lights, fx_brake_color)
	_setup_omni_lights(fx_reverse_lights, fx_reverse_color)
	_setup_omni_lights(nitro_fx_lights, nitro_fx_color)
	
	current_front_lights_energy = fx_front_intensity
	_setup_spot_lights(fx_front_lights, Color.WHITE, current_front_lights_energy)
	
	_setup_omni_light(fx_turn_signal_left_light, Color(1.0, 0.7, 0.0), 0.0)
	_setup_omni_light(fx_turn_signal_right_light, Color(1.0, 0.7, 0.0), 0.0)

	for trail in nitro_trails:
		if trail:
			trail.emitting = false
			trail.visible = false

	input_controller.brake_state_changed.connect(_on_brake_state_changed)
	input_controller.reverse_state_changed.connect(_on_reverse_state_changed)
	input_controller.nitro_state_changed.connect(_on_nitro_state_changed)
	input_controller.movement_state_changed.connect(_on_movement_state_changed)
	input_controller.engine_state_changed.connect(_on_engine_state_changed)
	
	input_controller.front_lights_toggled.connect(_on_front_lights_toggled)
	input_controller.turn_signal_state_changed.connect(_on_turn_signal_state_changed)

func _physics_process(delta):
	current_brake = move_toward(current_brake, 0.0, fx_off_speed * delta)
	current_reverse = move_toward(current_reverse, 0.0, fx_off_speed * delta)
	current_nitro_lights = move_toward(current_nitro_lights, 0.0, nitro_off_speed * delta)
	
	_update_omni_intensity(fx_brake_lights, current_brake)
	_update_omni_intensity(fx_reverse_lights, current_reverse)
	_update_omni_intensity(nitro_fx_lights, current_nitro_lights)

	_update_front_lights(delta)
	_update_turn_signals(delta)
	_update_skid_marks()

func _on_brake_state_changed(braking: bool):
	var target = fx_brake_intensity if braking else 0.0
	var speed = fx_on_speed if braking else fx_off_speed
	current_brake = move_toward(current_brake, target, speed * get_physics_process_delta_time())

func _on_reverse_state_changed(reversing: bool):
	var target = fx_reverse_intensity if reversing else 0.0
	var speed = fx_on_speed if reversing else fx_off_speed
	current_reverse = move_toward(current_reverse, target, speed * get_physics_process_delta_time())

func _on_nitro_state_changed(active: bool):
	for p in nitro_GPU_particles:
		if p: p.emitting = active
	for trail in nitro_trails:
		if trail:
			trail.emitting = active
			trail.visible = active

	var target = nitro_fx_intensity if active else 0.0
	var speed = nitro_on_speed if active else nitro_off_speed
	current_nitro_lights = move_toward(current_nitro_lights, target, speed * get_physics_process_delta_time())

func _on_movement_state_changed(moving: bool):
	for dust in dust_GPU_particles:
		if dust: dust.emitting = moving

func _on_engine_state_changed(_running: bool, _starting: bool):
	pass

func _on_front_lights_toggled(on: bool):
	front_lights_active = on

func _on_turn_signal_state_changed(left: bool, right: bool):
	turn_left_on = left
	turn_right_on = right
	if not left and not right:
		blinker_time = 0.0

func _setup_omni_light(light: OmniLight3D, color: Color, intensity: float):
	if light:
		light.light_color = color
		light.light_energy = intensity

func _setup_omni_lights(lights: Array[OmniLight3D], color: Color):
	for light in lights:
		_setup_omni_light(light, color, 0.0)

func _setup_spot_lights(lights: Array[SpotLight3D], color: Color, intensity: float):
	for light in lights:
		if light:
			light.light_color = color
			light.light_energy = intensity

func _update_omni_intensity(lights: Array[OmniLight3D], intensity: float):
	for light in lights:
		if light: light.light_energy = intensity
			
func _update_spot_intensity(lights: Array[SpotLight3D], intensity: float):
	for light in lights:
		if light: light.light_energy = intensity


func _update_front_lights(delta):
	var target = fx_front_intensity if front_lights_active else 0.0
	current_front_lights_energy = move_toward(current_front_lights_energy, target, fx_front_fade_speed * delta)
	_update_spot_intensity(fx_front_lights, current_front_lights_energy)

func _update_turn_signals(delta):
	if not turn_left_on and not turn_right_on:
		_setup_omni_light(fx_turn_signal_left_light, Color(1.0, 0.7, 0.0), 0.0)
		_setup_omni_light(fx_turn_signal_right_light, Color(1.0, 0.7, 0.0), 0.0)
		return
		
	blinker_time = fmod(blinker_time + delta, fx_blinker_cycle_time * 2.0)
	var blinker_state_on = blinker_time < fx_blinker_cycle_time
	var intensity = fx_blinker_intensity if blinker_state_on else 0.0
	
	if turn_left_on:
		_setup_omni_light(fx_turn_signal_left_light, Color(1.0, 0.7, 0.0), intensity)
	
	if turn_right_on:
		_setup_omni_light(fx_turn_signal_right_light, Color(1.0, 0.7, 0.0), intensity)

func _update_skid_marks():
	if not vehicle_node:
		return
		
	var all_wheels: Array[Wheel] = [
		vehicle_node.front_left_wheel, 
		vehicle_node.front_right_wheel, 
		vehicle_node.rear_left_wheel, 
		vehicle_node.rear_right_wheel
	]
	all_wheels.append_array(vehicle_node.extra_wheels)

	for i in range(min(all_wheels.size(), skid_marks_GPU_particles.size())):
		var wheel = all_wheels[i]
		var skid_marker = skid_marks_GPU_particles[i]

		if not is_instance_valid(wheel) or not is_instance_valid(skid_marker):
			continue

		var should_emit = vehicle_node.engine_on and (wheel.handbrake_active or wheel.is_drifting)
		
		if should_emit and wheel.is_colliding():
			skid_marker.emitting = true
			
			var contact_point = wheel.get_collision_point()
			skid_marker.global_position = contact_point + Vector3.UP * 0.01 

			skid_marker.look_at(skid_marker.global_position + vehicle_node.global_basis.z, Vector3.UP)
		else:
			skid_marker.emitting = false 
