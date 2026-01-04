extends Node
class_name VehicleSoundController

@export_group("Node References")
## [b][img width=8]res://Assets/UI/EU.png[/img] Vehicle Node Reference[/b]
## The main [Vehicle] node whose data (e.g., RPM, speed, gear) is used to drive the audio system.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Referencia al Nodo Vehículo
## El nodo principal [Vehicle] cuyos datos (ej. RPM, velocidad, marcha) se utilizan para controlar el sistema de audio.
@export var vehicle_node: Vehicle
## [b][img width=8]res://Assets/UI/EU.png[/img] Input Controller Reference[/b]
## The [VehicleInputController] node used to get input status (e.g., throttle, clutch) for sound logic.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Referencia al Controlador de Entrada
## El nodo [VehicleInputController] utilizado para obtener el estado de la entrada (ej. acelerador, embrague) para la lógica de sonido.
@export var input_controller: VehicleInputController

@export_group("Engine")
## [b][img width=8]res://Assets/UI/EU.png[/img] Engine Start-Up Sound[/b]
## [AudioStreamPlayer3D] for the engine starting sound effect.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Sonido de Encendido del Motor
## [AudioStreamPlayer3D] para el efecto de sonido de encendido del motor.
@export var engine_start_up : AudioStreamPlayer3D
## [b][img width=8]res://Assets/UI/EU.png[/img] Idle Engine Sound[/b]
## [AudioStreamPlayer3D] for the engine running at idle RPM.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Sonido de Motor en Ralentí
## [AudioStreamPlayer3D] para el motor funcionando a RPM de ralentí.
@export var idle_engine : AudioStreamPlayer3D

@export_group("Engine RPM Layers")
## [b][img width=8]res://Assets/UI/EU.png[/img] Low RPM Layer (On Throttle)[/b]
## [AudioStreamPlayer3D] for the low RPM range when accelerating.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Capa de RPM Bajas (Acelerando)
## [AudioStreamPlayer3D] para el rango de RPM bajas al acelerar.
@export var low_on : AudioStreamPlayer3D
## [b][img width=8]res://Assets/UI/EU.png[/img] Low RPM Layer (Off Throttle)[/b]
## [AudioStreamPlayer3D] for the low RPM range when decelerating/coasting.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Capa de RPM Bajas (Sin Acelerar)
## [AudioStreamPlayer3D] para el rango de RPM bajas al desacelerar/planear.
@export var low_off : AudioStreamPlayer3D
## [b][img width=8]res://Assets/UI/EU.png[/img] Mid RPM Layer (On Throttle)[/b]
## [AudioStreamPlayer3D] for the medium RPM range when accelerating.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Capa de RPM Medias (Acelerando)
## [AudioStreamPlayer3D] para el rango de RPM medias al acelerar.
@export var med_on : AudioStreamPlayer3D
## [b][img width=8]res://Assets/UI/EU.png[/img] Mid RPM Layer (Off Throttle)[/b]
## [AudioStreamPlayer3D] for the medium RPM range when decelerating/coasting.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Capa de RPM Medias (Sin Acelerar)
## [AudioStreamPlayer3D] para el rango de RPM medias al desacelerar/planear.
@export var med_off : AudioStreamPlayer3D
## [b][img width=8]res://Assets/UI/EU.png[/img] High RPM Layer (On Throttle)[/b]
## [AudioStreamPlayer3D] for the high RPM range when accelerating.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Capa de RPM Altas (Acelerando)
## [AudioStreamPlayer3D] para el rango de RPM altas al acelerar.
@export var high_on : AudioStreamPlayer3D
## [b][img width=8]res://Assets/UI/EU.png[/img] High RPM Layer (Off Throttle)[/b]
## [AudioStreamPlayer3D] for the high RPM range when decelerating/coasting.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Capa de RPM Altas (Sin Acelerar)
## [AudioStreamPlayer3D] para el rango de RPM altas al desacelerar/planear.
@export var high_off : AudioStreamPlayer3D
## [b][img width=8]res://Assets/UI/EU.png[/img] Max RPM Limiter/Redline Sound[/b]
## [AudioStreamPlayer3D] for the engine sound at maximum RPM (e.g., limiter).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Sonido de Límite/Línea Roja de RPM
## [AudioStreamPlayer3D] para el sonido del motor a las RPM máximas (ej. limitador).
@export var maxRPM : AudioStreamPlayer3D

@export_group("Mufflers")
## [b][img width=8]res://Assets/UI/EU.png[/img] Muffler Layer 1 (On Throttle)[/b]
## [AudioStreamPlayer3D] for the first exhaust/muffler sound layer when accelerating.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Capa 1 de Silenciador (Acelerando)
## [AudioStreamPlayer3D] para la primera capa de sonido de escape/silenciador al acelerar.
@export var mufller_on_1: AudioStreamPlayer3D
## [b][img width=8]res://Assets/UI/EU.png[/img] Muffler Layer 2 (On Throttle)[/b]
## [AudioStreamPlayer3D] for the second exhaust/muffler sound layer when accelerating.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Capa 2 de Silenciador (Acelerando)
## [AudioStreamPlayer3D] para la segunda capa de sonido de escape/silenciador al acelerar.
@export var mufller_on_2: AudioStreamPlayer3D
## [b][img width=8]res://Assets/UI/EU.png[/img] Muffler Layer 3 (On Throttle)[/b]
## [AudioStreamPlayer3D] for the third exhaust/muffler sound layer when accelerating.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Capa 3 de Silenciador (Acelerando)
## [AudioStreamPlayer3D] para la tercera capa de sonido de escape/silenciador al acelerar.
@export var mufller_on_3: AudioStreamPlayer3D
## [b][img width=8]res://Assets/UI/EU.png[/img] Muffler Layer 4 (On Throttle)[/b]
## [AudioStreamPlayer3D] for the fourth exhaust/muffler sound layer when accelerating.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Capa 4 de Silenciador (Acelerando)
## [AudioStreamPlayer3D] para la cuarta capa de sonido de escape/silenciador al acelerar.
@export var mufller_on_4: AudioStreamPlayer3D
## [b][img width=8]res://Assets/UI/EU.png[/img] Muffler Layer 5 (On Throttle)[/b]
## [AudioStreamPlayer3D] for the fifth exhaust/muffler sound layer when accelerating.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Capa 5 de Silenciador (Acelerando)
## [AudioStreamPlayer3D] para la quinta capa de sonido de escape/silenciador al acelerar.
@export var mufller_on_5: AudioStreamPlayer3D
## [b][img width=8]res://Assets/UI/EU.png[/img] Muffler Layer 1 (Off Throttle)[/b]
## [AudioStreamPlayer3D] for the first exhaust/muffler sound layer when decelerating/coasting.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Capa 1 de Silenciador (Sin Acelerar)
## [AudioStreamPlayer3D] para la primera capa de sonido de escape/silenciador al desacelerar/planear.
@export var mufller_off_1: AudioStreamPlayer3D
## [b][img width=8]res://Assets/UI/EU.png[/img] Muffler Layer 2 (Off Throttle)[/b]
## [AudioStreamPlayer3D] for the second exhaust/muffler sound layer when decelerating/coasting.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Capa 2 de Silenciador (Sin Acelerar)
## [AudioStreamPlayer3D] para la segunda capa de sonido de escape/silenciador al desacelerar/planear.
@export var mufller_off_2: AudioStreamPlayer3D
## [b][img width=8]res://Assets/UI/EU.png[/img] Muffler Layer 3 (Off Throttle)[/b]
## [AudioStreamPlayer3D] for the third exhaust/muffler sound layer when decelerating/coasting.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Capa 3 de Silenciador (Sin Acelerar)
## [AudioStreamPlayer3D] para la tercera capa de sonido de escape/silenciador al desacelerar/planear.
@export var mufller_off_3: AudioStreamPlayer3D
## [b][img width=8]res://Assets/UI/EU.png[/img] Muffler Layer 4 (Off Throttle)[/b]
## [AudioStreamPlayer3D] for the fourth exhaust/muffler sound layer when decelerating/coasting.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Capa 4 de Silenciador (Sin Acelerar)
## [AudioStreamPlayer3D] para la cuarta capa de sonido de escape/silenciador al desacelerar/planear.
@export var mufller_off_4: AudioStreamPlayer3D
## [b][img width=8]res://Assets/UI/EU.png[/img] Muffler Layer 5 (Off Throttle)[/b]
## [AudioStreamPlayer3D] for the fifth exhaust/muffler sound layer when decelerating/coasting.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Capa 5 de Silenciador (Sin Acelerar)
## [AudioStreamPlayer3D] para la quinta capa de sonido de escape/silenciador al desacelerar/planear.
@export var mufller_off_5: AudioStreamPlayer3D

@export_group("Shift")
## [b][img width=8]res://Assets/UI/EU.png[/img] Gear Shift Sound[/b]
## [AudioStreamPlayer3D] for the gear shift sound effect (for both up and down shifts).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Sonido de Cambio de Marcha
## [AudioStreamPlayer3D] para el efecto de sonido de cambio de marcha (tanto ascendente como descendente).
@export var shift: AudioStreamPlayer3D

@export_group("Reverse")
## [b][img width=8]res://Assets/UI/EU.png[/img] Reversing Sound (Car)[/b]
## [AudioStreamPlayer3D] for the standard car reversing sound (e.g., electronic beep).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Sonido de Marcha Atrás (Coche)
## [AudioStreamPlayer3D] para el sonido estándar de marcha atrás de coche (ej. pitido electrónico).
@export var reversing: AudioStreamPlayer3D
## [b][img width=8]res://Assets/UI/EU.png[/img] Reversing Sound (Truck/Heavy Vehicle)[/b]
## [AudioStreamPlayer3D] for the heavy vehicle/truck reversing sound.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Sonido de Marcha Atrás (Camión/Vehículo Pesado)
## [AudioStreamPlayer3D] para el sonido de marcha atrás de vehículos pesados/camiones.
@export var truck_reversing: AudioStreamPlayer3D

@export_group("Shots")
## [b][img width=8]res://Assets/UI/EU.png[/img] Short Exhaust Shot Sound[/b]
## [AudioStreamPlayer3D] for a short exhaust pop/backfire sound.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Sonido de Explosión de Escape Corta
## [AudioStreamPlayer3D] para un sonido corto de explosión/petardeo del escape.
@export var short_shot: AudioStreamPlayer3D
## [b][img width=8]res://Assets/UI/EU.png[/img] Long Exhaust Shot Sound[/b]
## [AudioStreamPlayer3D] for a longer/louder exhaust pop/backfire sound.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Sonido de Explosión de Escape Larga
## [AudioStreamPlayer3D] para un sonido más largo/fuerte de explosión/petardeo del escape.
@export var long_shot: AudioStreamPlayer3D

@export_group("Supercharger")
## [b][img width=8]res://Assets/UI/EU.png[/img] Supercharger Spool-Up Sound[/b]
## [AudioStreamPlayer3D] for the supercharger spooling up/on throttle sound.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Sonido de Compresor Encendido
## [AudioStreamPlayer3D] para el sonido del compresor acelerando/con el acelerador pisado.
@export var supercharger_on: AudioStreamPlayer3D
## [b][img width=8]res://Assets/UI/EU.png[/img] Supercharger Spool-Down Sound[/b]
## [AudioStreamPlayer3D] for the supercharger spooling down/off throttle sound.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Sonido de Compresor Apagado
## [AudioStreamPlayer3D] para el sonido del compresor desacelerando/sin pisar el acelerador.
@export var supercharger_off: AudioStreamPlayer3D

@export_group("RPM Ranges")
## [b][img width=8]res://Assets/UI/EU.png[/img] Low RPM Range End (Ratio)[/b]
## The normalized RPM value (0.0 to 1.0) where the low RPM sound layer ends its fade and the medium layer begins.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Fin del Rango de RPM Bajas (Ratio)
## El valor de RPM normalizado (0.0 a 1.0) donde la capa de sonido de RPM bajas finaliza su fundido y comienza la capa media.
@export var low_rpm_end: float = 0.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Mid RPM Range End (Ratio)[/b]
## The normalized RPM value (0.0 to 1.0) where the medium RPM sound layer ends its fade and the high layer begins.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Fin del Rango de RPM Medias (Ratio)
## El valor de RPM normalizado (0.0 a 1.0) donde la capa de sonido de RPM medias finaliza su fundido y comienza la capa alta.
@export var med_rpm_end: float = 0.0
## [b][img width=8]res://Assets/UI/EU.png[/img] High RPM Range End (Ratio)[/b]
## The normalized RPM value (0.0 to 1.0) where the high RPM sound layer ends its fade and the maximum RPM sound may be used.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Fin del Rango de RPM Altas (Ratio)
## El valor de RPM normalizado (0.0 a 1.0) donde la capa de sonido de RPM altas finaliza su fundido y se puede usar el sonido de RPM máximas.
@export var high_rpm_end: float = 0.0

@export_group("Muffler Settings")
## [b][img width=8]res://Assets/UI/EU.png[/img] Muffler Volume Multiplier[/b]
## A general multiplier applied to the volume of all muffler layers.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Multiplicador de Volumen del Silenciador
## Un multiplicador general aplicado al volumen de todas las capas del silenciador.
@export var muffler_volume_multiplier: float = 0.6
## [b][img width=8]res://Assets/UI/EU.png[/img] Muffler Pitch Offset[/b]
## A constant pitch offset applied to the muffler sounds for tuning purposes.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Desplazamiento de Tono del Silenciador
## Un desplazamiento de tono constante aplicado a los sonidos del silenciador para ajustes finos.
@export var muffler_pitch_offset: float = -0.15
## [b][img width=8]res://Assets/UI/EU.png[/img] Muffler Crossfade Speed[/b]
## The speed at which the muffler layers crossfade between each other (e.g., from [code]mufller_on_1[/code] to [code]mufller_on_2[/code]).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Velocidad de Fundido Cruzado del Silenciador
## La velocidad a la que las capas del silenciador se funden entre sí (ej. de [code]mufller_on_1[/code] a [code]mufller_on_2[/code]).
@export var muffler_crossfade_speed: float = 0.5

@export_group("Shot Settings")
## [b][img width=8]res://Assets/UI/EU.png[/img] Shot Throttle Threshold[/b]
## The minimum normalized throttle input required to potentially trigger an exhaust shot/backfire.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Umbral de Acelerador para Explosión
## La entrada mínima normalizada del acelerador requerida para potencialmente activar una explosión/petardeo de escape.
@export var shot_throttle_threshold: float = 0.7
## [b][img width=8]res://Assets/UI/EU.png[/img] Shot RPM Threshold[/b]
## The minimum normalized RPM required to potentially trigger an exhaust shot/backfire.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Umbral de RPM para Explosión
## Las RPM mínimas normalizadas requeridas para potencialmente activar una explosión/petardeo de escape.
@export var shot_rpm_threshold: float = 0.5
## [b][img width=8]res://Assets/UI/EU.png[/img] Shot Cooldown (s)[/b]
## The minimum time (in seconds) between two consecutive exhaust shot triggers.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Tiempo de Espera para Explosión (s)
## El tiempo mínimo (en segundos) entre dos activaciones consecutivas de explosiones de escape.
@export var shot_cooldown: float = 0.5

@export_group("Supercharger Settings")
## [b][img width=8]res://Assets/UI/EU.png[/img] Supercharger RPM Threshold[/b]
## The normalized RPM value at which the supercharger spool sound begins to fade in.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Umbral de RPM del Compresor
## El valor de RPM normalizado en el que el sonido de aceleración del compresor comienza a fundirse.
@export var supercharger_rpm_threshold: float = 0.3
## [b][img width=8]res://Assets/UI/EU.png[/img] Supercharger Crossfade Speed[/b]
## The speed at which the [code]supercharger_on[/code] and [code]supercharger_off[/code] sounds crossfade.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Velocidad de Fundido Cruzado del Compresor
## La velocidad a la que los sonidos [code]supercharger_on[/code] y [code]supercharger_off[/code] se funden.
@export var supercharger_crossfade_speed: float = 0.4

@export_group("Volume Controls (dB)")
## [b][img width=8]res://Assets/UI/EU.png[/img] Engine Layers Volume (dB)[/b]
## Master volume (in dB) for the main engine RPM layer sounds ([code]low_on/off[/code], [code]med_on/off[/code], [code]high_on/off[/code]).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Volumen de Capas de Motor (dB)
## Volumen maestro (en dB) para los sonidos principales de las capas de RPM del motor.
@export var engine_layers_volume: float = 0.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Mufflers Volume (dB)[/b]
## Master volume (in dB) for all muffler/exhaust layer sounds.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Volumen de Silenciadores (dB)
## Volumen maestro (en dB) para todos los sonidos de las capas de escape/silenciador.
@export var mufflers_volume: float = 0.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Idle Engine Volume (dB)[/b]
## Volume (in dB) for the [code]idle_engine[/code] sound.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Volumen de Motor en Ralentí (dB)
## Volumen (en dB) para el sonido [code]idle_engine[/code].
@export var idle_volume: float = 0.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Shift Sound Volume (dB)[/b]
## Volume (in dB) for the gear shift sound ([code]shift[/code]).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Volumen de Sonido de Cambio (dB)
## Volumen (en dB) para el sonido de cambio de marcha ([code]shift[/code]).
@export var shift_volume: float = 0.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Max RPM Sound Volume (dB)[/b]
## Volume (in dB) for the maximum RPM/limiter sound ([code]maxRPM[/code]).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Volumen de Sonido de RPM Máximas (dB)
## Volumen (en dB) para el sonido de RPM máximas/limitador ([code]maxRPM[/code]).
@export var max_rpm_volume: float = 0.0

@export_subgroup("Reverse Volumes")
## [b][img width=8]res://Assets/UI/EU.png[/img] Car Reversing Volume (dB)[/b]
## Volume (in dB) for the standard car reversing sound ([code]reversing[/code]).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Volumen de Marcha Atrás de Coche (dB)
## Volumen (en dB) para el sonido estándar de marcha atrás de coche ([code]reversing[/code]).
@export var reversing_volume: float = 0.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Truck Reversing Volume (dB)[/b]
## Volume (in dB) for the truck/heavy vehicle reversing sound ([code]truck_reversing[/code]).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Volumen de Marcha Atrás de Camión (dB)
## Volumen (en dB) para el sonido de marcha atrás de camión/vehículo pesado ([code]truck_reversing[/code]).
@export var truck_reversing_volume: float = 0.0

@export_subgroup("Shot Volumes")
## [b][img width=8]res://Assets/UI/EU.png[/img] Short Shot Volume (dB)[/b]
## Volume (in dB) for the short exhaust shot sound ([code]short_shot[/code]).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Volumen de Explosión Corta (dB)
## Volumen (en dB) para el sonido corto de explosión de escape ([code]short_shot[/code]).
@export var short_shot_volume: float = 0.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Long Shot Volume (dB)[/b]
## Volume (in dB) for the long exhaust shot sound ([code]long_shot[/code]).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Volumen de Explosión Larga (dB)
## Volumen (en dB) para el sonido largo de explosión de escape ([code]long_shot[/code]).
@export var long_shot_volume: float = 0.0

@export_subgroup("Supercharger Volumes")
## [b][img width=8]res://Assets/UI/EU.png[/img] Supercharger On Volume (dB)[/b]
## Volume (in dB) for the supercharger spool-up sound ([code]supercharger_on[/code]).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Volumen de Compresor Encendido (dB)
## Volumen (en dB) para el sonido de aceleración del compresor ([code]supercharger_on[/code]).
@export var supercharger_on_volume_db: float = 0.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Supercharger Off Volume (dB)[/b]
## Volume (in dB) for the supercharger spool-down sound ([code]supercharger_off[/code]).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Volumen de Compresor Apagado (dB)
## Volumen (en dB) para el sonido de desaceleración del compresor ([code]supercharger_off[/code]).
@export var supercharger_off_volume_db: float = 0.0

const VOLUME_MAX: float = 1.0
const VOLUME_MIN: float = 0.0
const CROSSFADE_SMOOTHNESS: float = 0.6

var layers: Array = []
var layer_volumes: Dictionary = {}
var muffler_layers: Array = []
var muffler_volumes: Dictionary = {}
var previous_rpm: float = 0.0

var previous_gear: int = 0

var is_in_reverse: bool = false

var can_fire_shot: bool = true
var shot_timer: float = 0.0
var previous_throttle: float = 0.0

var supercharger_on_volume: float = 0.0
var supercharger_off_volume: float = 0.0

func _ready():
	if not input_controller or not vehicle_node:
		push_error("VehicleSoundController: Faltan referencias!")
		return
	
	input_controller.engine_state_changed.connect(_on_engine_state_changed)
	engine_start_up.finished.connect(_on_engine_start_up_finished)
	
	_calculate_rpm_ranges()
	_setup_layers()
	_setup_muffler_layers()
	_initialize_audio()
	set_physics_process(true)

func _calculate_rpm_ranges():
	var idle = vehicle_node.idle_rpm
	var max_rpm = vehicle_node.max_rpm
	var total_range = max_rpm - idle
	
	if low_rpm_end == 0.0:
		low_rpm_end = idle + (total_range * 0.35)
	if med_rpm_end == 0.0:
		med_rpm_end = idle + (total_range * 0.70)
	if high_rpm_end == 0.0:
		high_rpm_end = max_rpm

func _setup_layers():
	layers = [
		{
			"name": "low",
			"on": low_on,
			"off": low_off,
			"rpm_start": vehicle_node.idle_rpm,
			"rpm_end": low_rpm_end
		},
		{
			"name": "med",
			"on": med_on,
			"off": med_off,
			"rpm_start": low_rpm_end,
			"rpm_end": med_rpm_end
		},
		{
			"name": "high",
			"on": high_on,
			"off": high_off,
			"rpm_start": med_rpm_end,
			"rpm_end": high_rpm_end
		}
	]
	
	for layer in layers:
		layer_volumes[layer.name + "_on"] = 0.0
		layer_volumes[layer.name + "_off"] = 0.0

func _setup_muffler_layers():
	"""Configura las 5 capas de mufflers distribuidas en el rango de RPM"""
	var idle = vehicle_node.idle_rpm
	var max_rpm = vehicle_node.max_rpm
	var total_range = max_rpm - idle
	
	var segment = total_range / 4.0
	
	muffler_layers = [
		{
			"name": "muffler_1",
			"on": mufller_on_1,
			"off": mufller_off_1,
			"rpm_start": idle,
			"rpm_end": idle + (segment * 1.5)
		},
		{
			"name": "muffler_2",
			"on": mufller_on_2,
			"off": mufller_off_2,
			"rpm_start": idle + (segment * 0.5),
			"rpm_end": idle + (segment * 2.5)
		},
		{
			"name": "muffler_3",
			"on": mufller_on_3,
			"off": mufller_off_3,
			"rpm_start": idle + (segment * 1.5),
			"rpm_end": idle + (segment * 3.5)
		},
		{
			"name": "muffler_4",
			"on": mufller_on_4,
			"off": mufller_off_4,
			"rpm_start": idle + (segment * 2.5),
			"rpm_end": max_rpm
		},
		{
			"name": "muffler_5",
			"on": mufller_on_5,
			"off": mufller_off_5,
			"rpm_start": idle + (segment * 3.5),
			"rpm_end": max_rpm
		}
	]
	
	for layer in muffler_layers:
		muffler_volumes[layer.name + "_on"] = 0.0
		muffler_volumes[layer.name + "_off"] = 0.0

func _initialize_audio():
	if idle_engine:
		idle_engine.volume_db = -80.0
		if not idle_engine.playing:
			idle_engine.play()
	
	for layer in layers:
		if layer.on:
			layer.on.volume_db = -80.0
			if not layer.on.playing:
				layer.on.play()
		if layer.off:
			layer.off.volume_db = -80.0
			if not layer.off.playing:
				layer.off.play()
	
	for layer in muffler_layers:
		if layer.on:
			layer.on.volume_db = -80.0
			if not layer.on.playing:
				layer.on.play()
		if layer.off:
			layer.off.volume_db = -80.0
			if not layer.off.playing:
				layer.off.play()
	
	if maxRPM:
		maxRPM.volume_db = -80.0
	
	if reversing:
		reversing.volume_db = -80.0
	if truck_reversing:
		truck_reversing.volume_db = -80.0
	
	if supercharger_on:
		supercharger_on.volume_db = -80.0
		if not supercharger_on.playing:
			supercharger_on.play()
	if supercharger_off:
		supercharger_off.volume_db = -80.0
		if not supercharger_off.playing:
			supercharger_off.play()

func _on_engine_state_changed(running: bool, starting: bool):
	if starting:
		_set_volume_db(idle_engine, -80.0)
		for layer in layers:
			_set_volume_db(layer.on, -80.0)
			_set_volume_db(layer.off, -80.0)
		for layer in muffler_layers:
			_set_volume_db(layer.on, -80.0)
			_set_volume_db(layer.off, -80.0)
		if not engine_start_up.playing:
			engine_start_up.play()
	elif not running and not starting:
		engine_start_up.stop()
		_set_volume_db(idle_engine, -80.0)
		for layer in layers:
			_set_volume_db(layer.on, -80.0)
			_set_volume_db(layer.off, -80.0)
		for layer in muffler_layers:
			_set_volume_db(layer.on, -80.0)
			_set_volume_db(layer.off, -80.0)

func _on_engine_start_up_finished():
	if vehicle_node.engine_on:
		_set_volume_db(idle_engine, idle_volume)

func _physics_process(delta: float):
	if not vehicle_node or not vehicle_node.engine_on:
		_set_volume_db(idle_engine, -80.0)
		for layer in layers:
			_set_volume_db(layer.on, -80.0)
			_set_volume_db(layer.off, -80.0)
		for layer in muffler_layers:
			_set_volume_db(layer.on, -80.0)
			_set_volume_db(layer.off, -80.0)
		_set_volume_db(supercharger_on, -80.0)
		_set_volume_db(supercharger_off, -80.0)
		return
	
	var current_rpm = vehicle_node.motor_rpm
	var accelerating = vehicle_node.throttle_amount > 0.1
	var is_redline = vehicle_node.motor_is_redline
	
	if shot_timer > 0.0:
		shot_timer -= delta
		if shot_timer <= 0.0:
			can_fire_shot = true
	
	var rpm_threshold = vehicle_node.idle_rpm + 200
	if current_rpm < rpm_threshold and not accelerating:
		idle_engine.pitch_scale = 1.0
		_set_volume_db(idle_engine, idle_volume)
		for layer in layers:
			_set_volume_db(layer.on, -80.0)
			_set_volume_db(layer.off, -80.0)
		for layer in muffler_layers:
			_set_volume_db(layer.on, -80.0)
			_set_volume_db(layer.off, -80.0)
		_set_volume_db(supercharger_on, -80.0)
		_set_volume_db(supercharger_off, -80.0)
		return
	else:
		_set_volume_db(idle_engine, -80.0)
	
	var rpm_normalized = clampf((current_rpm - vehicle_node.idle_rpm) / (vehicle_node.max_rpm - vehicle_node.idle_rpm), 0.0, 1.0)
	var global_pitch = lerp(0.85, 1.9, rpm_normalized)
	var muffler_pitch = global_pitch + muffler_pitch_offset
	
	_process_main_layers(current_rpm, global_pitch, accelerating)
	_process_muffler_layers(current_rpm, muffler_pitch, accelerating)
	_process_shots(rpm_normalized, delta)
	_process_supercharger(rpm_normalized, accelerating, global_pitch)
	_detect_gear_shift()
	_process_reverse_sound(current_rpm)
	
	previous_rpm = current_rpm
	previous_throttle = vehicle_node.throttle_amount
	
	if is_redline:
		maxRPM.pitch_scale = 1.0
		if not maxRPM.playing:
			maxRPM.play()
		_set_volume_db(maxRPM, max_rpm_volume)
	else:
		_set_volume_db(maxRPM, -80.0)
		if maxRPM and maxRPM.volume_db < -60.0 and maxRPM.playing:
			maxRPM.stop()

func _process_main_layers(current_rpm: float, global_pitch: float, accelerating: bool):
	var target_volumes: Dictionary = {}
	var total_volume = 0.0
	
	for layer in layers:
		var rpm_start = layer.rpm_start
		var rpm_end = layer.rpm_end
		var rpm_range = rpm_end - rpm_start
		var rpm_center = rpm_start + (rpm_range * 0.5)
		
		var distance_from_center = abs(current_rpm - rpm_center)
		var normalized_distance = distance_from_center / (rpm_range * 0.5)
		var volume_factor = exp(-pow(normalized_distance * 0.5, 2.0))
		
		target_volumes[layer.name] = volume_factor
		total_volume += volume_factor
	
	if total_volume > 0.01:
		for key in target_volumes:
			target_volumes[key] /= total_volume
	
	for layer in layers:
		var target_vol = target_volumes[layer.name]
		var key_on = layer.name + "_on"
		var key_off = layer.name + "_off"
		
		if accelerating:
			layer_volumes[key_on] = lerp(layer_volumes[key_on], target_vol, CROSSFADE_SMOOTHNESS)
			layer_volumes[key_off] = lerp(layer_volumes[key_off], 0.0, CROSSFADE_SMOOTHNESS)
		else:
			layer_volumes[key_on] = lerp(layer_volumes[key_on], 0.0, CROSSFADE_SMOOTHNESS)
			layer_volumes[key_off] = lerp(layer_volumes[key_off], target_vol, CROSSFADE_SMOOTHNESS)
		
		if layer.on:
			layer.on.pitch_scale = global_pitch
		if layer.off:
			layer.off.pitch_scale = global_pitch
		
		_set_volume_linear_with_offset(layer.on, layer_volumes[key_on], engine_layers_volume)
		_set_volume_linear_with_offset(layer.off, layer_volumes[key_off], engine_layers_volume)

func _process_muffler_layers(current_rpm: float, muffler_pitch: float, accelerating: bool):
	var target_volumes: Dictionary = {}
	var total_volume = 0.0
	
	for layer in muffler_layers:
		var rpm_start = layer.rpm_start
		var rpm_end = layer.rpm_end
		var rpm_range = rpm_end - rpm_start
		var rpm_center = rpm_start + (rpm_range * 0.5)
		
		var distance_from_center = abs(current_rpm - rpm_center)
		var normalized_distance = distance_from_center / (rpm_range * 0.5)
		var volume_factor = exp(-pow(normalized_distance * 0.4, 2.0))
		
		target_volumes[layer.name] = volume_factor
		total_volume += volume_factor
	
	if total_volume > 0.01:
		for key in target_volumes:
			target_volumes[key] /= total_volume
	
	for layer in muffler_layers:
		var target_vol = target_volumes[layer.name] * muffler_volume_multiplier
		var key_on = layer.name + "_on"
		var key_off = layer.name + "_off"
		
		if accelerating:
			muffler_volumes[key_on] = lerp(muffler_volumes[key_on], target_vol, muffler_crossfade_speed)
			muffler_volumes[key_off] = lerp(muffler_volumes[key_off], 0.0, muffler_crossfade_speed)
		else:
			muffler_volumes[key_on] = lerp(muffler_volumes[key_on], 0.0, muffler_crossfade_speed)
			muffler_volumes[key_off] = lerp(muffler_volumes[key_off], target_vol, muffler_crossfade_speed)
		
		if layer.on:
			layer.on.pitch_scale = muffler_pitch
		if layer.off:
			layer.off.pitch_scale = muffler_pitch
		
		_set_volume_linear_with_offset(layer.on, muffler_volumes[key_on], mufflers_volume)
		_set_volume_linear_with_offset(layer.off, muffler_volumes[key_off], mufflers_volume)

func _detect_gear_shift():
	var current_gear = vehicle_node.current_gear
	
	if current_gear != previous_gear and current_gear != 0:
		var gear_diff = abs(current_gear - previous_gear)
		
		if gear_diff == 1 or previous_gear == 0 or previous_gear == -1 or current_gear == -1:
			_play_shift_sound()
	
	previous_gear = current_gear

func _play_shift_sound():
	if shift and not shift.playing:
		shift.pitch_scale = randf_range(0.95, 1.05)
		shift.volume_db = shift_volume
		shift.play()

func _process_reverse_sound(current_rpm: float):
	var current_gear = vehicle_node.current_gear
	var in_reverse_now = (current_gear == -1)
	
	if in_reverse_now != is_in_reverse:
		is_in_reverse = in_reverse_now
		
		if is_in_reverse:
			if reversing:
				reversing.volume_db = reversing_volume
				if not reversing.playing:
					reversing.play()
			
			if truck_reversing:
				truck_reversing.volume_db = truck_reversing_volume
				if not truck_reversing.playing:
					truck_reversing.play()
		else:
			if reversing:
				reversing.stop()
			if truck_reversing:
				truck_reversing.stop()
	
	if is_in_reverse and reversing and reversing.playing:
		var rpm_normalized = clampf((current_rpm - vehicle_node.idle_rpm) / (vehicle_node.max_rpm - vehicle_node.idle_rpm), 0.0, 1.0)
		reversing.pitch_scale = lerp(0.9, 1.3, rpm_normalized)

func _process_shots(rpm_normalized: float, delta: float):
	var current_throttle = vehicle_node.throttle_amount
	var throttle_released = (previous_throttle > shot_throttle_threshold and current_throttle < 0.3)
	
	if throttle_released and can_fire_shot and rpm_normalized > shot_rpm_threshold:
		if rpm_normalized > 0.75:
			if long_shot and not long_shot.playing:
				long_shot.pitch_scale = randf_range(0.95, 1.05)
				long_shot.volume_db = long_shot_volume
				long_shot.play()
		else:
			if short_shot and not short_shot.playing:
				short_shot.pitch_scale = randf_range(0.95, 1.05)
				short_shot.volume_db = short_shot_volume
				short_shot.play()
		
		can_fire_shot = false
		shot_timer = shot_cooldown

func _process_supercharger(rpm_normalized: float, accelerating: bool, global_pitch: float):
	var is_active = rpm_normalized > supercharger_rpm_threshold
	
	if is_active and accelerating:
		supercharger_on_volume = lerp(supercharger_on_volume, 1.0, supercharger_crossfade_speed)
		supercharger_off_volume = lerp(supercharger_off_volume, 0.0, supercharger_crossfade_speed)
	else:
		supercharger_on_volume = lerp(supercharger_on_volume, 0.0, supercharger_crossfade_speed)
		supercharger_off_volume = lerp(supercharger_off_volume, 1.0, supercharger_crossfade_speed)
	
	_set_volume_linear_with_offset(supercharger_on, supercharger_on_volume, supercharger_on_volume_db)
	_set_volume_linear_with_offset(supercharger_off, supercharger_off_volume, supercharger_off_volume_db)
	
	if supercharger_on:
		supercharger_on.pitch_scale = global_pitch
	if supercharger_off:
		supercharger_off.pitch_scale = lerp(0.9, 1.2, rpm_normalized)

func _set_volume_db(sound: AudioStreamPlayer3D, target_db: float):
	if sound:
		sound.volume_db = target_db

func _set_volume_linear(sound: AudioStreamPlayer3D, linear_volume: float):
	if not sound:
		return
	
	if linear_volume < 0.001:
		sound.volume_db = -80.0
	else:
		sound.volume_db = linear_to_db(linear_volume)

func _set_volume_linear_with_offset(sound: AudioStreamPlayer3D, linear_volume: float, volume_offset_db: float):
	if not sound:
		return
	
	if linear_volume < 0.001:
		sound.volume_db = -80.0
	else:
		sound.volume_db = linear_to_db(linear_volume) + volume_offset_db
