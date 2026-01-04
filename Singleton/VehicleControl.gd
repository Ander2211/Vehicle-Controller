extends Node

signal nitro_recharge_changed(value: float)

var nitro_recharge: float = 1.0:
	set(value):
		nitro_recharge = clampf(value, 0.0, 1.0)
		nitro_recharge_changed.emit(nitro_recharge)

func set_nitro_recharge(value: float) -> void:
	nitro_recharge = value

var current_speed: float = 0.0:
	set(value):
		current_speed = maxf(value, 0.0)

func set_current_speed(speed: float) -> void:
	current_speed = speed

var current_pan_state: String = "DEFAULT" 

func set_pan_state(state: String) -> void:
	current_pan_state = state
