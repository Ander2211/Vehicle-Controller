extends HBoxContainer

const INPUT_TEMPLATE = preload("uid://cblniwj1fkr3l")
const INPUT_ICONS_PATH = "res://Assets/Inputs/Keyboard/"

@export var max_logs: int = 3
@export var log_duration: float = 3.0

var logs: Array = []

func _input(event: InputEvent):
	if event is InputEventKey and event.pressed:
		if event.is_action_pressed("Steer Left"):
			_add_log("Steer Left", _get_icon_name(event))
		elif event.is_action_pressed("Steer Right"):
			_add_log("Steer Right", _get_icon_name(event))
		elif event.is_action_pressed("Brake"):
			_add_log("Brake", _get_icon_name(event))
		elif event.is_action_pressed("Throttle"):
			_add_log("Throttle", _get_icon_name(event))
		elif event.is_action_pressed("Handbrake"):
			_add_log("Handbrake", _get_icon_name(event))
		elif event.is_action_pressed("Clutch"):
			_add_log("Clutch", _get_icon_name(event))
		elif event.is_action_pressed("Toggle Transmission"):
			_add_log("Toggle Transmission", _get_icon_name(event))
		elif event.is_action_pressed("Shift Up"):
			_add_log("Shift Up", _get_icon_name(event))
		elif event.is_action_pressed("Shift Down"):
			_add_log("Shift Down", _get_icon_name(event))
		elif event.is_action_pressed("Pan Left"):
			_add_log("Pan Left", _get_icon_name(event))
		elif event.is_action_pressed("Pan Right"):
			_add_log("Pan Right", _get_icon_name(event))
		elif event.is_action_pressed("Pan Front"):
			_add_log("Pan Front", _get_icon_name(event))
		elif event.is_action_pressed("Nitro"):
			_add_log("Nitro", _get_icon_name(event))
		elif event.is_action_pressed("Engine"):
			_add_log("Engine", _get_icon_name(event))


func _get_icon_name(event: InputEventKey) -> String:
	var key_name := OS.get_keycode_string(event.physical_keycode).strip_edges()
	if key_name == "":
		key_name = "Unknown"
	key_name = key_name.replace(" ", "_")
	return "T_%s_Key_Dark.png" % key_name

func _add_log(action_text: String, icon_file: String):
	var template = INPUT_TEMPLATE.instantiate()
	var action_label: Label = template.get_node("Action")
	var icon_texture: TextureRect = template.get_node("Icon")
	
	action_label.text = action_text
	var icon_path = INPUT_ICONS_PATH + icon_file
	if ResourceLoader.exists(icon_path):
		icon_texture.texture = load(icon_path)
	else:
		print("Icon not found:", icon_path)
	
	add_child(template)
	logs.append(template)
	
	# === ELIMINAR LOGS ANTIGUOS ===
	if logs.size() > max_logs:
		var oldest = logs.pop_front()
		if is_instance_valid(oldest):
			oldest.queue_free()
	
	# === TIMER SEGURO CON WEAKREF ===
	var weak_template = weakref(template)
	var timer := get_tree().create_timer(log_duration)
	timer.timeout.connect(func():
		var node = weak_template.get_ref()
		if node and is_instance_valid(node):
			if node in logs:
				logs.erase(node)
			node.queue_free()
	)
