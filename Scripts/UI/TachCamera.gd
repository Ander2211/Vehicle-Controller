extends Sprite2D

@onready var camera_arrow: TextureRect = %CameraArrow
@onready var current_pan: Label = %CurrentPan

const ROT_DEFAULT = deg_to_rad(-90.0)   
const ROT_LEFT    = deg_to_rad(0.0)    
const ROT_RIGHT   = deg_to_rad(180.0)  
const ROT_FRONT   = deg_to_rad(90.0)   

func _process(_delta):
	current_pan.text = VehicleControl.current_pan_state

	match VehicleControl.current_pan_state:
		"DEFAULT":
			camera_arrow.rotation = ROT_DEFAULT
		"LEFT":
			camera_arrow.rotation = ROT_LEFT
		"RIGHT":
			camera_arrow.rotation = ROT_RIGHT
		"FRONT":
			camera_arrow.rotation = ROT_FRONT
