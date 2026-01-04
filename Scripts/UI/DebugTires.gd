extends PanelContainer

@onready var vehicle: Vehicle = get_parent().get_parent()
@onready var type: Label = %Type
@onready var info: VBoxContainer = %Info
@onready var template: HBoxContainer = %Template
@onready var title_label: Label = %Title   # El Label del título en la plantilla
@onready var data_label: Label = %Data     # El Label del valor en la plantilla

# Cache para no recrear nodos innecesariamente
var _surface_rows := {}

func _ready() -> void:
	# Escondemos la plantilla (solo la usamos como base)
	template.visible = false
	
	# Creamos las filas una sola vez
	_create_surface_info_rows()

func _process(_delta: float) -> void:
	if not vehicle or not vehicle.is_ready:
		return
	
	# Detectamos la superficie actual (cualquier rueda que esté tocando)
	var current_surface := _get_current_surface()
	if current_surface.is_empty():
		current_surface = "???"  # fallback
	
	# Actualizamos el tipo de superficie
	type.text = "Superficie: " + current_surface
	
	# Actualizamos los valores solo de la superficie detectada
	_update_surface_values(current_surface)

# ------------------------------------------------------------------
# Crea todas las filas una sola vez al iniciar
func _create_surface_info_rows() -> void:
	var params = [
		["Tire Stiffness", "tire_stiffnesses"],
		["Coef. Fricción", "coefficient_of_friction"],
		["Resistencia Rodadura", "rolling_resistance"],
		["Asist. Grip Lateral", "lateral_grip_assist"],
		["Ratio Grip Long.", "longitudinal_grip_ratio"],
	]
	
	for p in params:
		var row: HBoxContainer = template.duplicate()
		row.visible = true
		info.add_child(row)
		
		var title: Label = row.get_node("Title")
		var data: Label = row.get_node("Data")
		
		title.text = p[0] + ":"
		data.text = "?.??"
		
		_surface_rows[p[1]] = data

# ------------------------------------------------------------------
# Detecta qué superficie está tocando al menos una rueda
func _get_current_surface() -> String:
	for wheel in vehicle.wheel_array:
		if wheel.is_colliding() and not wheel.surface_type.is_empty():
			return wheel.surface_type
	return ""

# ------------------------------------------------------------------
# Actualiza solo los valores de la superficie actual
func _update_surface_values(surface: String) -> void:
	if surface.is_empty() or surface == "???":
		for label in _surface_rows.values():
			label.text = "—"
		return
	
	# Valores con 3 decimales para que se vea bien
	var stiffness = vehicle.tire_stiffnesses.get(surface, 0.0)
	var friction = vehicle.coefficient_of_friction.get(surface, 0.0)
	var rolling = vehicle.rolling_resistance.get(surface, 0.0)
	var lateral_assist = vehicle.lateral_grip_assist.get(surface, 0.0)
	var long_ratio = vehicle.longitudinal_grip_ratio.get(surface, 0.0)
	
	_surface_rows["tire_stiffnesses"].text   = "%0.3f" % stiffness
	_surface_rows["coefficient_of_friction"].text = "%0.3f" % friction
	_surface_rows["rolling_resistance"].text = "%0.3f" % rolling
	_surface_rows["lateral_grip_assist"].text = "%0.3f" % lateral_assist
	_surface_rows["longitudinal_grip_ratio"].text = "%0.3f" % long_ratio
