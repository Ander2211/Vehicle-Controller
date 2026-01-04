extends Node

class_name ExtraFeatures

@export_group("Vehicle Node")
## [b][img width=8]res://Assets/UI/EU.png[/img] Vehicle Node Reference[/b]
## The main [Vehicle] node that this script will control or enhance. [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Referencia al Nodo Vehículo
## El nodo principal [Vehicle] que este script controlará o mejorará.
@export var vehicle_node: Vehicle

@export_group("Nitro System")
## [b][img width=8]res://Assets/UI/EU.png[/img] Nitro System Enabled[/b]
## If true, enables the nitro/boost feature for the vehicle.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Sistema Nitro Habilitado
## Si es true, habilita la función de nitro/impulso para el vehículo.
@export var nitro_enabled := true
## [b][img width=8]res://Assets/UI/EU.png[/img] Torque Multiplier[/b]
## Multiplier applied to the engine's torque while nitro is active. [br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Multiplicador de Torque
## Multiplicador aplicado al torque del motor mientras el nitro está activo.
@export var nitro_multiplier := 2.0
## [b][img width=8]res://Assets/UI/EU.png[/img] RPM Multiplier[/b]
## Multiplier applied to the engine's maximum RPM while nitro is active. Helps to reach higher speeds.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Multiplicador de RPM
## Multiplicador aplicado a las RPM máximas del motor mientras el nitro está activo. Ayuda a alcanzar velocidades más altas.
@export var nitro_rpm_multiplier := 1.3
## [b][img width=8]res://Assets/UI/EU.png[/img] Maximum Duration (s)[/b]
## The maximum time (in seconds) that the nitro can be used continuously.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Duración Máxima (s)
## El tiempo máximo (en segundos) que el nitro puede usarse de forma continua.
@export var nitro_duration := 3.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Full Recharge Time (s)[/b]
## The total time (in seconds) required to fully recharge the nitro reserve from empty.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Tiempo de Recarga Total (s)
## El tiempo total (en segundos) requerido para recargar completamente la reserva de nitro desde vacío.
@export var nitro_recharge_time := 10.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Drain Rate (per second)[/b]
## The rate at which the nitro reserve drains per second when active. Calculated as 1.0 / [code]nitro_duration[/code].[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Tasa de Agotamiento (por segundo)
## La tasa a la que se agota la reserva de nitro por segundo cuando está activo. Calculado como 1.0 / [code]nitro_duration[/code].
@export var nitro_drain_rate := 1.0 / 3.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Recharge Rate (per second)[/b]
## The rate at which the nitro reserve recharges per second when not active. Calculated as 1.0 / [code]nitro_recharge_time[/code].[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Tasa de Recarga (por segundo)
## La tasa a la que se recarga la reserva de nitro por segundo cuando no está activo. Calculado como 1.0 / [code]nitro_recharge_time[/code].
@export var nitro_recharge_rate := 1.0 / 10.0

@export_group("Speedbreaker System")
## [b][img width=8]res://Assets/UI/EU.png[/img] Speedbreaker System Enabled[/b]
## If true, enables the speedbreaker/bullet-time feature for the vehicle.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Sistema Speedbreaker Habilitado
## Si es true, habilita la función de speedbreaker/tiempo bala para el vehículo.
@export var speedbreaker_enabled := true
## [b][img width=8]res://Assets/UI/EU.png[/img] Maximum Duration (s)[/b]
## The maximum time (in seconds) that the speedbreaker can be used continuously.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Duración Máxima (s)
## El tiempo máximo (en segundos) que el speedbreaker puede usarse de forma continua.
@export var speedbreaker_duration := 3.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Full Recharge Time (s)[/b]
## The total time (in seconds) required to fully recharge the speedbreaker reserve from empty.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Tiempo de Recarga Total (s)
## El tiempo total (en segundos) requerido para recargar completamente la reserva de speedbreaker desde vacío.
@export var speedbreaker_recharge_time := 10.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Drain Rate (per second)[/b]
## The rate at which the speedbreaker reserve drains per second when active. Calculated as 1.0 / [code]speedbreaker_duration[/code].[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Tasa de Agotamiento (por segundo)
## La tasa a la que se agota la reserva de speedbreaker por segundo cuando está activo. Calculado como 1.0 / [code]speedbreaker_duration[/code].
@export var speedbreaker_drain_rate := 1.0 / 3.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Recharge Rate (per second)[/b]
## The rate at which the speedbreaker reserve recharges per second when not active. Calculated as 1.0 / [code]speedbreaker_recharge_time[/code].[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Tasa de Recarga (por segundo)
## La tasa a la que se recarga la reserva de speedbreaker por segundo cuando no está activo. Calculado como 1.0 / [code]speedbreaker_recharge_time[/code].
@export var speedbreaker_recharge_rate := 1.0 / 10.0

var nitro_active := false
var nitro_level := 1.0  
var nitro_input := 0.0  

var speedbreaker_active := false
var speedbreaker_level := 1.0  
var speedbreaker_input := 0.0  
var _target_time_scale := 1.0
var _time_scale_speed := 2.0  

func process_nitro(delta: float) -> void:
	if not nitro_enabled or not is_instance_valid(vehicle_node) or not vehicle_node.engine_on:
		nitro_active = false
		return

	if nitro_input > 0.5 and nitro_level > 0.0 and not nitro_active:
		nitro_active = true
	elif nitro_input <= 0.5:
		nitro_active = false

	if nitro_active:
		nitro_level -= nitro_drain_rate * delta
		if nitro_level <= 0.0:
			nitro_level = 0.0
			nitro_active = false 

	elif nitro_level < 1.0:
		nitro_level += nitro_recharge_rate * delta
		nitro_level = minf(nitro_level, 1.0)

func process_speedbreaker(delta: float) -> void:
	if not speedbreaker_enabled or not is_instance_valid(vehicle_node) or not vehicle_node.engine_on:
		speedbreaker_active = false
		_target_time_scale = 1.0
		Engine.time_scale = lerpf(Engine.time_scale, _target_time_scale, _time_scale_speed * delta)
		return

	if speedbreaker_input > 0.5 and speedbreaker_level > 0.0:
		speedbreaker_active = true
	else:
		speedbreaker_active = false

	if speedbreaker_active:
		speedbreaker_level -= speedbreaker_drain_rate * delta
		speedbreaker_level = maxf(speedbreaker_level, 0.0)
		_target_time_scale = 0.3
	else:
		if speedbreaker_level < 1.0:
			speedbreaker_level += speedbreaker_recharge_rate * delta
			speedbreaker_level = minf(speedbreaker_level, 1.0)
		_target_time_scale = 1.0

	Engine.time_scale = lerpf(Engine.time_scale, _target_time_scale, _time_scale_speed * delta)

func get_telemetry_string() -> String:
	if not is_instance_valid(vehicle_node):
		return "Marcha: N/A | Velocidad: N/A"

	var gear_display: String
	var current_gear_safe = 0
	if vehicle_node.has_method("get_current_gear"):
		current_gear_safe = vehicle_node.get_current_gear()
	elif vehicle_node.has_method("get_gear"):
		current_gear_safe = vehicle_node.get_gear()
	else:
		current_gear_safe = vehicle_node.current_gear
		
	if current_gear_safe == 0:
		gear_display = "N"
	elif current_gear_safe == -1:
		gear_display = "R"
	else:
		gear_display = str(current_gear_safe)

	var speed_ms = vehicle_node.linear_velocity.length()
	var speed_kmh = speed_ms * 3.6 

	return "Marcha: %s | Velocidad: %.0f km/h" % [
		gear_display, 
		speed_kmh
	]
