extends Sprite2D

@onready var nos_progress_bar: TextureProgressBar = %NOSProgressBar
@onready var nos_arrow: TextureRect = %NOSArrow

const MIN_ROTATION: float = deg_to_rad(-37.0)
const MAX_ROTATION: float = deg_to_rad(215.0)

func _process(_delta):
	var nitro_percent: float = VehicleControl.nitro_recharge * 70.0
	nos_progress_bar.value = nitro_percent

	var t: float = VehicleControl.nitro_recharge  # 0.0 → 1.0
	nos_arrow.rotation = lerp(MIN_ROTATION, MAX_ROTATION, t)
