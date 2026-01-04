extends TextureRect

@onready var vehicle: Vehicle = get_parent().get_parent()
@onready var navigation_camera: Camera3D = %NavigationCamera
@onready var navigation_arrow: Sprite3D = %NavigationArrow

@export var rotate_camera_with_vehicle: bool = true

func _process(_delta):
	if not vehicle or not navigation_camera:
		return

	navigation_camera.global_position.x = vehicle.global_position.x
	navigation_camera.global_position.z = vehicle.global_position.z

	if rotate_camera_with_vehicle:
		navigation_camera.global_rotation.y = vehicle.global_rotation.y
