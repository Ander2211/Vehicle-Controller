extends Node

@export var camera_height: float = 2.0

@onready var vehicle: Vehicle = get_parent().get_parent()
@onready var camera_car_rearview: Camera3D = %CameraCarRearview

var offset_transform: Transform3D

func _ready():
	offset_transform = vehicle.global_transform.affine_inverse() * camera_car_rearview.global_transform
	var origin := offset_transform.origin
	origin.y = camera_height
	offset_transform.origin = origin

func _physics_process(_delta):
	camera_car_rearview.global_transform = vehicle.global_transform * offset_transform
