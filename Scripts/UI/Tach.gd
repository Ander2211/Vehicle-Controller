extends Sprite2D

@onready var tach_arrow: TextureRect = %TachArrow
@onready var kmh: Label = %KMH
@onready var car_mileage: Label = %CarMileage
@onready var gearbox_type: Label = %GearboxType
@onready var gear_shift: Label = %GearShift
@onready var vehicle: Vehicle = get_parent().get_parent()

var last_gear := 0
var total_distance: float = 0.0 # Distancia recorrida en metros
var last_printed_speed_kmh: int = 0 # Rastrea la última velocidad impresa (múltiplo de 50 km/h)
var elapsed_time: float = 0.0 # Nuevo: Rastrea el tiempo total transcurrido

func _process(_delta: float) -> void:
	if not vehicle or not kmh or not gear_shift or not tach_arrow or not car_mileage or not gearbox_type:
		return

	# --- ACTUALIZAR TIEMPO ---
	elapsed_time += _delta

	# --- VELOCIDAD KM/H ---
	# Usar linear_velocity.length() para una lectura de velocidad más precisa en el RigidBody.
	var current_speed_kmh: int = int(vehicle.linear_velocity.length() * 3.6) 
	kmh.text = str(current_speed_kmh)

	# --- LÓGICA DE IMPRESIÓN POR CADA 50 KM/H ---
	# Calcula el múltiplo de 50 km/h que se acaba de cruzar (ej: 130 km/h -> 100)
	var current_band: int = (current_speed_kmh / 50) * 50 

	if current_band > last_printed_speed_kmh and current_band > 0:
		var time_taken: float = elapsed_time
		var gear_text = _get_gear_text(vehicle.current_gear)
		
		## Imprimir la velocidad, el tiempo y la marcha
		#print("¡Velocidad alcanzada!: ", current_band, " km/h, Tiempo: ", "%.2f" % time_taken, "s, Marcha: ", gear_text)
		
		last_printed_speed_kmh = current_band
	elif current_band < last_printed_speed_kmh - 50:
		# Si la velocidad cae más de 50 km/h por debajo del último hito impreso, 
		# se reinicia el rastreador para que pueda volver a registrar las velocidades al acelerar.
		last_printed_speed_kmh = current_band

	# --- ACUMULAR DISTANCIA (en metros) ---
	total_distance += vehicle.linear_velocity.length() * _delta # m/s * s = metros

	# --- KILOMETRAJE: 1 unidad cada 1000 metros (1 km) ---
	var mileage_units: int = int(total_distance / 1000.0) # 1000 m = 1 unidad
	mileage_units = min(mileage_units, 99999) # Máximo 99999
	car_mileage.text = "%05d" % mileage_units # Formato: 00000 → 99999

	# --- TIPO DE TRANSMISIÓN: AUTO / MANUAL ---
	gearbox_type.text = "AUTO" if vehicle.automatic_transmission else "MANUAL"

	# --- MARCHA ACTUAL ---
	var gear := vehicle.current_gear
	gear_shift.text = _get_gear_text(gear)
	if gear != last_gear:
		last_gear = gear
		last_gear = gear

	# --- TAQUÍMETRO (AGUJA) ---
	var min_rpm: float = vehicle.idle_rpm
	var max_rpm: float = vehicle.max_rpm
	var rpm_percent: float = clamp((vehicle.motor_rpm - min_rpm) / (max_rpm - min_rpm), 0.0, 1.0)
	var rotation_deg: float = lerp(-35.0, 214.0, rpm_percent)
	tach_arrow.rotation_degrees = rotation_deg

func _get_gear_text(g: int) -> String:
	return "R" if g == -1 else "N" if g == 0 else str(g)
