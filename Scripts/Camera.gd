extends Camera3D

@export_group("Camera Follow Settings")

## [b][img width=8]res://Assets/UI/EU.png[/img] Follow Distance[/b]
## Distance behind the vehicle where the camera stays.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Distancia detrás del vehículo donde la cámara se mantiene.
@export var follow_distance = 10

## [b][img width=8]res://Assets/UI/EU.png[/img] Follow Height[/b]
## Vertical offset above the followed vehicle.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Desplazamiento vertical sobre el vehículo seguido.
@export var follow_height = 5

## [b][img width=8]res://Assets/UI/EU.png[/img] Camera Smooth Speed[/b]
## Controls how fast the camera interpolates position and rotation.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Controla qué tan rápido la cámara interpola posición y rotación.
@export var speed := 20.0

## [b][img width=8]res://Assets/UI/EU.png[/img] Follow Target[/b]
## The [code]RigidBody3D[/code] this camera will follow.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] El [code]RigidBody3D[/code] que esta cámara seguirá.
@export var follow_this : RigidBody3D


@export_group("Pan Inputs")

## [b][img width=8]res://Assets/UI/EU.png[/img] Pan Left Input[/b]
## Input action used to switch to the left-side camera view.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Acción de entrada para cambiar a la vista lateral izquierda.
@export var pan_left_input: String = "Pan Left"

## [b][img width=8]res://Assets/UI/EU.png[/img] Pan Right Input[/b]
## Input action used to switch to the right-side camera view.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Acción de entrada para cambiar a la vista lateral derecha.
@export var pan_right_input: String = "Pan Right"

## [b][img width=8]res://Assets/UI/EU.png[/img] Pan Front Input[/b]
## Input action used to activate the front-facing camera view.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Acción de entrada para activar la vista frontal de la cámara.
@export var pan_front_input: String = "Pan Front"



const PAN_LEFT_POS = Vector3(-10, 0, 0)
const PAN_LEFT_ROT = Vector3(0, deg_to_rad(-90), 0)
const PAN_RIGHT_POS = Vector3(10, 0, 0)
const PAN_RIGHT_ROT = Vector3(0, deg_to_rad(90), 0)
const PAN_FRONT_ROT = Vector3(0, deg_to_rad(180), 0)
const DEFAULT_ROT = Vector3(0, 0, 0)

var PAN_FRONT_POS : Vector3
var DEFAULT_POS : Vector3
var target_pos_offset : Vector3 = Vector3(0, follow_height, follow_distance)
var target_rot : Vector3 = Vector3.ZERO
var start_rotation : Vector3
var start_position : Vector3

const MIN_SPEED_KMH: float = 60.0
const MAX_SPEED_KMH: float = 100.0
const MIN_FOV: float = 75.0  
const MAX_FOV: float = 90.0 

func _ready():
	start_rotation = rotation
	start_position = position
	PAN_FRONT_POS = Vector3(0, 0, -follow_distance)
	DEFAULT_POS = Vector3(0, 0, follow_distance)
	_set_pan_position(DEFAULT_POS, DEFAULT_ROT)
	VehicleControl.set_pan_state("DEFAULT")

func _physics_process(delta : float):
	if not follow_this:
		return

	var _any_pan_pressed := false
	if pan_left_input != "" and Input.is_action_pressed(pan_left_input):
		_set_pan_position(PAN_LEFT_POS, PAN_LEFT_ROT)
		VehicleControl.set_pan_state("LEFT")
		_any_pan_pressed = true
	elif pan_right_input != "" and Input.is_action_pressed(pan_right_input):
		_set_pan_position(PAN_RIGHT_POS, PAN_RIGHT_ROT)
		VehicleControl.set_pan_state("RIGHT")
		_any_pan_pressed = true
	elif pan_front_input != "" and Input.is_action_pressed(pan_front_input):
		_set_pan_position(PAN_FRONT_POS, PAN_FRONT_ROT)
		VehicleControl.set_pan_state("FRONT")
		_any_pan_pressed = true
	else:
		_set_pan_position(DEFAULT_POS, DEFAULT_ROT)
		VehicleControl.set_pan_state("DEFAULT")

	var vehicle_transform = follow_this.global_transform
	var world_offset = vehicle_transform.basis * target_pos_offset
	var target_position = follow_this.global_position + world_offset
	global_position = global_position.lerp(target_position, speed * delta)
	global_rotation = global_rotation.lerp(target_rot, speed * 0.5 * delta)
	look_at(follow_this.global_position, Vector3.UP)

	var speed_kmh: float = VehicleControl.current_speed * 3.6
	var target_fov: float = MIN_FOV

	if speed_kmh >= MIN_SPEED_KMH:
		var t = clampf((speed_kmh - MIN_SPEED_KMH) / (MAX_SPEED_KMH - MIN_SPEED_KMH), 0.0, 1.0)
		target_fov = MIN_FOV + (t * (MAX_FOV - MIN_FOV))

	fov = lerp(fov, target_fov, 8.0 * delta)

func _set_pan_position(offset_local: Vector3, rot_y: Vector3):
	target_pos_offset = Vector3(offset_local.x, follow_height, offset_local.z)
	target_rot = rot_y
