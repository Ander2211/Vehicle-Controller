extends CanvasLayer

@export var vehicle_node: Vehicle
@export var input_controller: VehicleInputController

@onready var engine: TextureRect = %Engine
@onready var speed_breaker: TextureProgressBar = %SpeedBreaker
@onready var tach: Sprite2D = $Tach
@onready var nos: Sprite2D = $NOS
@onready var camera: Sprite2D = $Camera
@onready var map_frame: TextureRect = $MapFrame
@onready var vehicle: Vehicle = get_parent()
@onready var speed_fx: ColorRect = %SpeedFX

var hud_elements: Array[CanvasItem] = []
var target_modulate: Color = Color.WHITE
var current_modulate: Color = Color.WHITE
const MODULATE_SPEED: float = 6.0

const ENGINE_OFF_COLOR: Color = Color(0.137, 0.137, 0.137)
const ENGINE_ON_COLOR: Color = Color(0.957, 0.549, 0.024)
const FLASH_RED: Color = Color(1.0, 0.0, 0.0)


var is_flashing: bool = false
var flash_timer: float = 0.0
const FLASH_DURATION: float = 1.5
const FLASH_CYCLES: int = 3
var flash_phase: float = 0.0

# === EFECTO DE VELOCIDAD ===
const MIN_SPEED_KMH: float = 60.0
const MAX_SPEED_KMH: float = 100.0
const MAX_EFFECT_POWER: float = 0.5

func _ready() -> void:
	hud_elements = [speed_breaker, tach, nos, camera, map_frame]
	_update_hud_modulate()
	_update_engine_icon()

func _process(delta: float) -> void:
	if not vehicle:
		return

	# === DETECTAR GIRO DE LLAVE ===
	if Input.is_action_just_pressed("Engine"):
		if not vehicle.engine_on:
			if not is_flashing:
				is_flashing = true
				flash_timer = FLASH_DURATION
				flash_phase = 0.0
		else:
			is_flashing = false

	# === PARPADEO SOLO AL ENCENDER ===
	if is_flashing:
		flash_timer -= delta
		flash_phase += delta
		var t = 1.0 - (flash_timer / FLASH_DURATION)
		var cycle = sin(t * TAU * FLASH_CYCLES)
		var intensity = (cycle + 1.0) * 0.5
		var flash_color = ENGINE_ON_COLOR.lerp(FLASH_RED, intensity)
		engine.modulate = flash_color
		if flash_timer <= 0.0:
			is_flashing = false
			engine.modulate = ENGINE_ON_COLOR
	else:
		var target_color = ENGINE_ON_COLOR if vehicle.engine_on else ENGINE_OFF_COLOR
		engine.modulate = engine.modulate.lerp(target_color, 10.0 * delta)

	# === HUD PRINCIPAL ===
	var new_target := Color.WHITE if vehicle.engine_on else Color(0.175, 0.175, 0.175)
	if new_target != target_modulate:
		target_modulate = new_target
	if not current_modulate.is_equal_approx(target_modulate):
		current_modulate = current_modulate.lerp(target_modulate, MODULATE_SPEED * delta)
		_update_hud_modulate()

	# === SPEEDBREAKER BAR — CORRECCIÓN ===
	var extra_features = vehicle.extra_features
	if speed_breaker and is_instance_valid(extra_features):
		speed_breaker.value = extra_features.speedbreaker_level * 100.0

	# === EFECTO DE VELOCIDAD ===
	var speed_kmh: float = vehicle.speed * 3.6
	var effect_power: float = 0.0
	if speed_kmh >= MIN_SPEED_KMH:
		var t = clampf((speed_kmh - MIN_SPEED_KMH) / (MAX_SPEED_KMH - MIN_SPEED_KMH), 0.0, 1.0)
		effect_power = t * MAX_EFFECT_POWER
	if speed_fx and speed_fx.material:
		speed_fx.material.set_shader_parameter("effect_power", effect_power)

	if VehicleControl.has_method("set_current_speed"):
		VehicleControl.set_current_speed(vehicle.speed)

func _update_hud_modulate() -> void:
	for element in hud_elements:
		if element and element is CanvasItem:
			element.modulate = current_modulate

func _update_engine_icon() -> void:
	engine.modulate = ENGINE_OFF_COLOR if not vehicle.engine_on else ENGINE_ON_COLOR
