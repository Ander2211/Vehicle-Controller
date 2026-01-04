class_name Vehicle
extends RigidBody3D

@export_group("Preset")
## [b][img width=8]res://Assets/UI/EU.png[/img] Use Preset[/b]
## If true, overrides all configurable parameters with the selected [VehiclePreset] (excluding wheels).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Si es true, sobrescribe todos los parámetros configurables con el [VehiclePreset] seleccionado (excluyendo ruedas).
@export var use_preset: bool = false
## [b][img width=8]res://Assets/UI/EU.png[/img] Vehicle Preset Resource[/b]
## The [VehiclePreset] resource containing all non-node settings to load.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] El recurso [VehiclePreset] que contiene todos los ajustes que no son nodos para cargar.
@export var vehicle_preset: VehiclePreset = null

@export_group("Extra Features Node")
## [b][img width=8]res://Assets/UI/EU.png[/img] Extra Features Node[/b]
## Assign a node with extra features (e.g., nitro, speedbreaker).[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Asigna un nodo con características adicionales (ej. nitro o cámara lenta).
@export var extra_features: ExtraFeatures

@export_group("Wheel Nodes")
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Left Wheel[/b]
## Assign this to the Wheel [RayCast3D] that is this vehicle's front left wheel.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Asigna la rueda delantera izquierda (RayCast3D + script [Wheel]).
@export var front_left_wheel : Wheel
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Right Wheel[/b]
## Assign this to the Wheel [RayCast3D] that is this vehicle's front right wheel.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Asigna la rueda delantera derecha (RayCast3D + script [Wheel]).
@export var front_right_wheel : Wheel
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear Left Wheel[/b]
## Assign this to the Wheel [RayCast3D] that is this vehicle's rear left wheel.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Asigna la rueda trasera izquierda (RayCast3D + script [Wheel]).
@export var rear_left_wheel : Wheel
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear Right Wheel[/b]
## Assign this to the Wheel [RayCast3D] that is this vehicle's rear right wheel.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Asigna la rueda trasera derecha (RayCast3D + script [Wheel]).
@export var rear_right_wheel : Wheel
## [b][img width=8]res://Assets/UI/EU.png[/img] Extra Wheels[/b]
## Additional wheels (RayCast3D + [Wheel] script) used by this vehicle.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Ruedas adicionales (RayCast3D + script Wheel) utilizadas por este vehículo.
@export var extra_wheels : Array[Wheel]


@export_group("Engine")
## [b][img width=8]res://Assets/UI/EU.png[/img] Engine On/Off[/b]
## Turn On/Off engine.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Enciende/Apaga el motor.
@export var engine_on := false
var engine_was_on: bool = false


@export_group("Steering")
## [b][img width=8]res://Assets/UI/EU.png[/img] Steering Input Rate[/b]
## The rate that the steering input changes in order to smooth
## out direction changes to the wheel.
## Steering input is between -1 and 1. Speed is in units per second.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] La tasa a la que la entrada de dirección cambia para suavizar
## los cambios de dirección de la rueda. La entrada está entre -1 y 1. La velocidad es en unidades por segundo.
@export var steering_speed := 4.25
## [b][img width=8]res://Assets/UI/EU.png[/img] Countersteer Speed[/b]
## The rate that the steering input changes when steering back to center.
## Speed is in units per second.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] La tasa a la que la entrada de dirección cambia al regresar al centro.
## La velocidad es en unidades por segundo.
@export var countersteer_speed := 11.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Steering Speed Decay[/b]
## Reduces steering input based on the vehicle's speed.
## Steering speed is divided by the velocity at this magnitude.
## The larger the number, the slower the steering at speed.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Reduce la entrada de dirección basándose en la velocidad del vehículo.
## La velocidad de dirección se divide por la velocidad en esta magnitud.
## Cuanto mayor sea el número, más lenta será la dirección a gran velocidad.
@export var steering_speed_decay := 0.20
## [b][img width=8]res://Assets/UI/EU.png[/img] Steering Slip Assist Threshold[/b]
## Further steering input is prevented if the wheels' lateral slip is greater than this number.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Se evita más entrada de dirección si el deslizamiento lateral de las ruedas es mayor que este número.
@export var steering_slip_assist := 0.15
## [b][img width=8]res://Assets/UI/EU.png[/img] Countersteer Assist Magnitude[/b]
## The magnitude to adjust steering toward the direction of travel based on the vehicle's lateral velocity.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] La magnitud para ajustar la dirección hacia el sentido de avance basándose en la velocidad lateral del vehículo.
@export var countersteer_assist := 0.9
## [b][img width=8]res://Assets/UI/EU.png[/img] Steering Exponent[/b]
## Steering input is raised to the power of this number.
## This has the effect of slowing steering input near the limits.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] La entrada de dirección se eleva a esta potencia, lo que tiene el efecto de ralentizar el control cerca de los límites.
@export var steering_exponent := 1.5
## [b][img width=8]res://Assets/UI/EU.png[/img] Maximum Steering Angle (Radians)[/b]
## The maximum steering angle in radians.
## [br][br]
## [b]Note:[/b] This property is edited in the inspector in degrees. If you want to use degrees in a script, use [code]deg_to_rad[/code].[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Ángulo de dirección máximo en radianes.
## [br][br]
## [b]Nota:[/b] Esta propiedad se edita en el inspector en grados. Si deseas usar grados en un script, utiliza [code]deg_to_rad[/code].
@export_range(0, 360, 0.1, "radians_as_degrees") var max_steering_angle := deg_to_rad(40.0)
@export_subgroup("Front Axle", "front_")
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Steering Ratio[/b]
## The ratio that the wheels turn based on steering input.
## [br]The higher this value, the more the wheels will turn due to steering input.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] La proporción en que las ruedas giran basándose en la entrada de dirección.
## [br]Cuanto mayor sea este valor, más girarán las ruedas debido a la entrada de dirección.
@export var front_steering_ratio := 1.0
## Ackermann wheel steering angle correction
#@export var front_ackermann := 0.15
@export_subgroup("Rear Axle", "rear_")
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear Steering Ratio[/b]
## The ratio the wheels turn based on steering input.
## [br]The higher this value, the more the wheels will turn due to steering input.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] La proporción en que las ruedas giran basándose en la entrada de dirección.
## [br]Cuanto mayor sea este valor, más girarán las ruedas debido a la entrada de dirección.
@export var rear_steering_ratio := 0.0


@export_group("Throttle and Braking")
## [b][img width=8]res://Assets/UI/EU.png[/img] Throttle Input Rate[/b]
## The rate the throttle input changes to smooth input.
## Throttle input is between 0 and 1. Speed is in units per second.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] La tasa a la que la entrada del acelerador cambia para suavizar el control.
## La entrada del acelerador está entre 0 y 1. La velocidad es en unidades por segundo.
@export var throttle_speed := 20.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Throttle Steering Adjust[/b]
## Multiply the throttle speed by this based on steering input.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Multiplica la velocidad del acelerador por este valor basándose en la entrada de dirección.
@export var throttle_steering_adjust := 0.1
## [b][img width=8]res://Assets/UI/EU.png[/img] Braking Input Rate[/b]
## The rate braking input changes to smooth input.
## Braking input is between 0 and 1. Speed is in units per second.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] La tasa a la que la entrada de frenado cambia para suavizar el control.
## La entrada de frenado está entre 0 y 1. La velocidad es en unidades por segundo.
@export var braking_speed := 10.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Brake Force Multiplier[/b]
## Multiplies the automatically calculated brake force.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Multiplica la fuerza de frenado calculada automáticamente.
@export var brake_force_multiplier := 1.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Brake Bias[/b]
## Ratio of total brake force applied as front wheels : back wheels. If this value is
## below 0.0, this value will be automatically calculated instead.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Proporción de la fuerza de frenado total aplicada a las ruedas delanteras : ruedas traseras. Si este valor es
## menor a 0.0, el valor será calculado automáticamente.
@export var front_brake_bias := -1.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Traction Control Max Slip[/b]
## Prevents engine power from causing the tires to slip beyond this value.
## Values below 0 disable the effect.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Evita que la potencia del motor cause que los neumáticos deslicen más allá de este valor.
## Los valores menores a 0 deshabilitan el efecto.
@export var traction_control_max_slip := 8.0
@export_subgroup("Front Axle", "front_")
## [b][img width=8]res://Assets/UI/EU.png[/img] Front ABS Pulse Time[/b]
## How long the ABS releases the brake, in seconds, when the
## spin threshold is crossed.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] El tiempo (en segundos) que el ABS libera el freno cuando se
## supera el umbral de deslizamiento.
@export var front_abs_pulse_time := 0.03
## [b][img width=8]res://Assets/UI/EU.png[/img] Front ABS Spin Threshold[/b]
## The difference in speed required between the wheel and the
## driving surface for ABS to engage.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] La diferencia de velocidad requerida entre la rueda y la
## superficie de conducción para que el ABS se active.
@export var front_abs_spin_difference_threshold := 12.0
@export_subgroup("Rear Axle", "rear_")
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear ABS Pulse Time[/b]
## How long the ABS releases the brake, in seconds, when the
## spin threshold is crossed.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] El tiempo (en segundos) que el ABS libera el freno cuando se
## supera el umbral de deslizamiento.
@export var rear_abs_pulse_time := 0.03
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear ABS Spin Threshold[/b]
## The difference in speed required between the wheel and the
## driving surface for ABS to engage.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] La diferencia de velocidad requerida entre la rueda y la
## superficie de conducción para que el ABS se active.
@export var rear_abs_spin_difference_threshold := 12.0


@export_group("Stability")
## [b][img width=8]res://Assets/UI/EU.png[/img] Enable Stability Control[/b]
## Stability applies torque forces to the vehicle body when the body angle
## relative to the direction of travel exceeds a threshold.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Si es true, el vehículo aplicará fuerzas de torque para estabilizar la carrocería cuando sea necesario.
@export var enable_stability := true
## [b][img width=8]res://Assets/UI/EU.png[/img] Stability Yaw Engage Angle[/b]
## The yaw angle the vehicle must reach before stability is applied.
## Based on the dot product, 0 being straight, 1 being 90 degrees[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] El ángulo de guiñada que el vehículo debe alcanzar antes de que se aplique la estabilidad.
## Basado en el producto punto, 0 es recto, 1 es 90 grados.
@export var stability_yaw_engage_angle := 0.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Stability Yaw Strength[/b]
## Strength multiplier for the applied yaw correction.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Multiplicador de fuerza para la corrección de guiñada aplicada.
@export var stability_yaw_strength := 6.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Stability Yaw Ground Multiplier[/b]
## Additional strength multiplier for a grounded vehicle to overcome traction.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Multiplicador de fuerza adicional para que un vehículo en el suelo supere la tracción.
@export var stability_yaw_ground_multiplier := 2.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Stability Upright Spring[/b]
## A multiplier for the torque used to keep the vehicle upright while airborne.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Un multiplicador para el torque utilizado para mantener el vehículo erguido mientras está en el aire.
@export var stability_upright_spring := 1.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Stability Upright Damping[/b]
## A multiplier for the torque used to dampen rotation while airborne.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Un multiplicador para el torque utilizado para amortiguar la rotación mientras está en el aire.
@export var stability_upright_damping := 1000.0


@export_group("Motor")
## [b][img width=8]res://Assets/UI/EU.png[/img] Maximum Torque (NM)[/b]
## Maximum motor torque in NM.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Torque máximo del motor en NM.
@export var max_torque := 300.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Maximum RPM[/b]
## Maximum motor RPM.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] RPM máximas del motor.
@export var max_rpm := 7000.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Idle RPM[/b]
## Idle motor RPM.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] RPM de ralentí del motor.
@export var idle_rpm := 1000.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Torque Curve[/b]
## Percentage of torque produced across the RPM range.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Porcentaje de torque producido a lo largo del rango de RPM.
@export var torque_curve : Curve
## [b][img width=8]res://Assets/UI/EU.png[/img] Variable Motor Drag[/b]
## Variable motor drag based on RPM.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Arrastre variable del motor basado en las RPM.
@export var motor_drag := 0.005
## [b][img width=8]res://Assets/UI/EU.png[/img] Constant Motor Brake[/b]
## Constant motor drag.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Arrastre constante del motor (freno de motor).
@export var motor_brake := 10.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Motor Moment of Inertia[/b]
## Moment of inertia for the motor.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Momento de inercia para el motor.
@export var motor_moment := 0.5
## [b][img width=8]res://Assets/UI/EU.png[/img] Clutch Out RPM[/b]
## The motor will use this rpm when launching from a stop.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] El motor usará estas RPM al arrancar desde parado.
@export var clutch_out_rpm := 3000.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Max Clutch Torque Ratio[/b]
## Max clutch torque as a ratio of max motor torque.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Torque máximo del embrague como una proporción del torque máximo del motor.
@export var max_clutch_torque_ratio := 1.6


@export_group("Gearbox")
## [b][img width=8]res://Assets/UI/EU.png[/img] Gear Ratios[/b]
## Transmission gear ratios, the size of the array determines the number of gears[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Relaciones de marcha de la transmisión, el tamaño del array determina el número de marchas.
@export var gear_ratios : Array[float] = [ 3.8, 2.3, 1.7, 1.3, 1.0, 0.8 ]
## [b][img width=8]res://Assets/UI/EU.png[/img] Final Drive Ratio[/b]
## Final drive ratio[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Relación de transmisión final (diferencial).
@export var final_drive := 3.2
## [b][img width=8]res://Assets/UI/EU.png[/img] Reverse Gear Ratio[/b]
## Reverse gear ratio[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Relación de la marcha atrás.
@export var reverse_ratio := 3.3
## [b][img width=8]res://Assets/UI/EU.png[/img] Shift Time[/b]
## Time it takes to change gears on up shifts in seconds[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Tiempo que tarda en cambiar de marcha en cambios ascendentes (en segundos).
@export var shift_time := 0.3
## [b][img width=8]res://Assets/UI/EU.png[/img] Automatic Transmission[/b]
## Enables automatic gear changes[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Habilita los cambios de marcha automáticos.
@export var automatic_transmission := true
## [b][img width=8]res://Assets/UI/EU.png[/img] Automatic Shift Delay[/b]
## Timer to prevent the automatic gear shifts changing gears too quickly
## in milliseconds[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Temporizador (en milisegundos) para evitar que los cambios automáticos se sucedan demasiado rápido.
@export var automatic_time_between_shifts := 1000.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Drivetrain Inertia[/b]
## Drivetrain inertia[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Inercia de la transmisión.
@export var gear_inertia := 0.02


@export_group("Drivetrain")
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Torque Split[/b]
## Torque delivered to the front wheels vs the rear wheels.
## Value of 1 is FWD, a value of 0 is RWD, anything in between is AWD.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Torque entregado a las ruedas delanteras vs las traseras.
## Un valor de 1 es tracción delantera (FWD), 0 es trasera (RWD), y cualquier valor intermedio es total (AWD).
@export var front_torque_split := 0.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Variable Torque Split[/b]
## When enabled, the torque split will change based on wheel slip.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Cuando está habilitado, el reparto de torque cambiará basándose en el deslizamiento de las ruedas.
@export var variable_torque_split := false
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Variable Split Ratio[/b]
## Torque split to interpolate toward when there is wheel slip. Variable Torque
## Split must be enabled.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Relación de torque frontal a la que interpolar cuando hay deslizamiento de la rueda. El reparto de torque variable debe estar habilitado.
@export var front_variable_split := 0.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Variable Split Interpolation Speed[/b]
## How quickly to interpolate between torque splits in seconds.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Qué tan rápido interpolar entre los repartos de torque en segundos.
@export var variable_split_speed := 1.0
@export_subgroup("Front Axle", "front_")
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Locking Diff Engage Torque[/b]
## The wheels of the axle will be forced to spin the same speed if there
## is at least this much torque applied. Keeps vehicle from spinning one wheel.
## Torque is measured after multiplied by the current gear ratio.
## Negative values will disable.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Las ruedas del eje serán forzadas a girar a la misma velocidad si se
## aplica al menos esta cantidad de torque. Evita que el vehículo patine una sola rueda.
## El torque se mide después de ser multiplicado por la relación de marcha actual.
## Los valores negativos lo deshabilitan.
@export var front_locking_differential_engage_torque := 200.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Torque Vectoring[/b]
## The amount of torque vectoring to apply to the axle based on steering input.
## Only functions if the differential is locked.
## A value of 1.0 would apply all torque to the outside wheel.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] La cantidad de vectorización de torque a aplicar al eje basándose en la entrada de dirección.
## Solo funciona si el diferencial está bloqueado.
## Un valor de 1.0 aplicaría todo el torque a la rueda exterior.
@export var front_torque_vectoring := 0.0
@export_subgroup("Rear Axle", "rear_")
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear Locking Diff Engage Torque[/b]
## The wheels of the axle will be forced to spin the same speed if there
## is at least this much torque applied. Keeps vehicle from spinning one wheel.
## Torque is measured after multiplied by the current gear ratio.
## Negative values will disable.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Las ruedas del eje serán forzadas a girar a la misma velocidad si se
## aplica al menos esta cantidad de torque. Evita que el vehículo patine una sola rueda.
## El torque se mide después de ser multiplicado por la relación de marcha actual.
## Los valores negativos lo deshabilitan.
@export var rear_locking_differential_engage_torque := 200.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear Torque Vectoring[/b]
## The amount of torque vectoring to apply to the axle based on steering input.
## Only functions if the differential is locked.
## A value of 1.0 would apply all torque to the outside wheel.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] La cantidad de vectorización de torque a aplicar al eje basándose en la entrada de dirección.
## Solo funciona si el diferencial está bloqueado.
## Un valor de 1.0 aplicaría todo el torque a la rueda exterior.
@export var rear_torque_vectoring := 0.0


@export_group("Suspension")
## [b][img width=8]res://Assets/UI/EU.png[/img] Vehicle Mass (kg)[/b]
## Vehicle mass in kilograms.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Masa del vehículo en kilogramos.
@export var vehicle_mass := 1500.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Weight Distribution[/b]
## The percentage of the vehicle mass over the front axle.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] El porcentaje de la masa del vehículo sobre el eje delantero.
@export var front_weight_distribution := 0.5
## [b][img width=8]res://Assets/UI/EU.png[/img] Center of Gravity Height Offset[/b]
## The center of gravity is calculated from the front weight distribution
## with the height centered on the wheel raycast positions. This will offset
## the height from that calculated position.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] El centro de gravedad se calcula a partir de la distribución de peso frontal
## con la altura centrada en las posiciones del raycast de la rueda. Esto desplazará
## la altura desde esa posición calculada.
@export var center_of_gravity_height_offset := -0.2
## [b][img width=8]res://Assets/UI/EU.png[/img] Inertia Multiplier[/b]
## Multiplies the calculated inertia by this value.
## Greater inertia values will cause more force to be
## required to rotate the car.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Multiplica la inercia calculada por este valor.
## Valores de inercia mayores harán que se requiera más fuerza
## para rotar el coche.
@export var inertia_multiplier := 1.2
@export_subgroup("Front Axle", "front_")
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Spring Length (m)[/b]
## The amount of suspension travel in meters.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] La cantidad de recorrido de la suspensión en metros.
@export var front_spring_length := 0.15
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Resting Ratio[/b]
## How much the spring is compressed when the vehicle is at rest.
## This is used to calculate the approriate spring rate for the wheel.
## A value of 0 would be a fully compressed spring.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Cuánto está comprimido el muelle cuando el vehículo está en reposo.
## Esto se utiliza para calcular la tasa de muelle adecuada para la rueda.
## Un valor de 0 sería un muelle completamente comprimido.
@export var front_resting_ratio := 0.5
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Damping Ratio[/b]
## Damping ratio is used to calculate the damping forces on the spring.
## A value of 1 would be critically damped. Passenger cars typically have a
## ratio around 0.3, while a race car could be as high as 0.9.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] La relación de amortiguación se utiliza para calcular las fuerzas de amortiguación en el muelle.
## Un valor de 1 sería amortiguación crítica. Los coches de pasajeros suelen tener una
## relación de alrededor de 0.3, mientras que un coche de carreras podría ser tan alto como 0.9.
@export var front_damping_ratio := 0.4
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Bump Damp Multiplier[/b]
## Bump damping multiplier applied to the damping force calculated from the
## damping ratio. A typical ratio for a passenger car is 2/3 bump damping to
## 3/2 rebound damping. Race cars typically run 3/2 bump to 2/3 rebound.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Multiplicador de amortiguación de compresión (bump) aplicado a la fuerza de amortiguación calculada a partir de la
## relación de amortiguación. Una relación típica para un coche de pasajeros es 2/3 bump a 3/2 rebound. Los coches de carreras suelen usar 3/2 bump a 2/3 rebound.
@export var front_bump_damp_multiplier := 0.6667
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Rebound Damp Multiplier[/b]
## Rebound damping multiplier applied to the damping force calculated from the
## damping ratio. A typical ratio for a passenger car is 2/3 bump damping to
## 3/2 rebound damping. Race cars typically run 3/2 bump to 2/3 rebound.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Multiplicador de amortiguación de rebote (rebound) aplicado a la fuerza de amortiguación calculada a partir de la
## relación de amortiguación. Una relación típica para un coche de pasajeros es 2/3 bump a 3/2 rebound. Los coches de carreras suelen usar 3/2 bump a 2/3 rebound.
@export var front_rebound_damp_multiplier := 1.5
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Anti-Roll Bar Ratio[/b]
## Antiroll bar stiffness as a ratio to spring stiffness.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Rigidez de la barra estabilizadora como una proporción de la rigidez del muelle.
@export var front_arb_ratio := 0.25
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Camber (Radians)[/b]
## Wheel camber isn't simulated, but giving the raycast a slight angle helps
## with simulation stability. Measured in radians.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] La caída de la rueda no se simula, pero darle un ligero ángulo al raycast ayuda con la estabilidad de la simulación. Medido en radianes.
@export var front_camber := 0.01745329
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Toe (Radians)[/b]
## Toe of the tires measured in radians.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Convergencia (Toe) de los neumáticos medida en radianes.
@export var front_toe := 0.01
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Bump Stop Multiplier[/b]
## Multiplier for the force applied when the suspension is fully compressed.
## If the vehicle bounces off large bumps, reducing this will help.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Multiplicador para la fuerza aplicada cuando la suspensión está completamente comprimida (tope de suspensión).
## Si el vehículo rebota en grandes baches, reducir esto ayudará.
@export var front_bump_stop_multiplier := 1.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Beam Axle[/b]
## If true the wheels of this axle will be aligned as if they were attached to
## a beam axle. This setting does not affect vehicle handling.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Si es true, las ruedas de este eje se alinearán como si estuvieran unidas a
## un eje rígido. Esta configuración no afecta el manejo del vehículo.
@export var front_beam_axle := false
@export_subgroup("Rear Axle", "rear_")
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear Spring Length (m)[/b]
## The amount of suspension travel in meters. Rear suspension typically has
## more travel than the front.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] La cantidad de recorrido de la suspensión en metros. La suspensión trasera típicamente tiene
## más recorrido que la delantera.
@export var rear_spring_length := 0.2
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear Resting Ratio[/b]
## How much the spring is compressed when the vehicle is at rest.
## This is used to calculate the approriate spring rate for the wheel.
## A value of 1 would be a fully compressed spring. With a value of 0.5 the
## suspension will rest at the center of it's length.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Cuánto está comprimido el muelle cuando el vehículo está en reposo.
## Esto se utiliza para calcular la tasa de muelle adecuada para la rueda.
## Un valor de 1 sería un muelle completamente comprimido. Con un valor de 0.5 la
## suspensión descansará en el centro de su longitud.
@export var rear_resting_ratio := 0.5
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear Damping Ratio[/b]
## Damping ratio is used to calculate the damping forces on the spring.
## A value of 1 would be critically damped. Passenger cars typically have a
## ratio around 0.3, while a race car could be as high as 0.9.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] La relación de amortiguación se utiliza para calcular las fuerzas de amortiguación en el muelle.
## Un valor de 1 sería amortiguación crítica. Los coches de pasajeros típicamente tienen una
## relación de alrededor de 0.3, mientras que un coche de carreras podría ser tan alto como 0.9.
@export var rear_damping_ratio := 0.4
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear Bump Damp Multiplier[/b]
## Bump damping multiplier applied to the damping force calulated from the
## damping ratio. A typical ratio for a passenger car is 2/3 bump damping to
## 3/2 rebound damping. Race cars typically run 3/2 bump to 2/3 rebound.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Multiplicador de amortiguación de compresión (bump) aplicado a la fuerza de amortiguación calculada a partir de la
## relación de amortiguación. Una relación típica para un coche de pasajeros es 2/3 bump a 3/2 rebound. Los coches de carreras suelen usar 3/2 bump a 2/3 rebound.
@export var rear_bump_damp_multiplier := 0.6667
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear Rebound Damp Multiplier[/b]
## Rebound damping multiplier applied to the damping force calulated from the
## damping ratio. A typical ratio for a passenger car is 2/3 bump damping to
## 3/2 rebound damping. Race cars typically run 3/2 bump to 2/3 rebound.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Multiplicador de amortiguación de rebote (rebound) aplicado a la fuerza de amortiguación calculada a partir de la
## relación de amortiguación. Una relación típica para un coche de pasajeros es 2/3 bump a 3/2 rebound. Los coches de carreras suelen usar 3/2 bump a 2/3 rebound.
@export var rear_rebound_damp_multiplier := 1.5
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear Anti-Roll Bar Ratio[/b]
## Antiroll bar stiffness as a ratio to spring stiffness.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Rigidez de la barra estabilizadora como una proporción de la rigidez del muelle.
@export var rear_arb_ratio := 0.25
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear Camber (Radians)[/b]
## Wheel camber isn't simulated, but giving the raycast a slight angle helps
## with simulation stability.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] La caída de la rueda no se simula, pero darle un ligero ángulo al raycast ayuda con la estabilidad de la simulación.
@export var rear_camber := 0.01745329
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear Toe (Radians)[/b]
## Toe of the tires measured in radians.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Convergencia (Toe) de los neumáticos medida en radianes.
@export var rear_toe := 0.01
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear Bump Stop Multiplier[/b]
## Multiplier for the force applied when the suspension is fully compressed.
## If the vehicle bounces off large bumps, reducing this will help.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Multiplicador para la fuerza aplicada cuando la suspensión está completamente comprimida (tope de suspensión).
## Si el vehículo rebota en grandes baches, reducir esto ayudará.
@export var rear_bump_stop_multiplier := 1.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear Beam Axle[/b]
## If true the wheels of this axle will be aligned as if they were attached to
## a beam axle. This setting does not affect vehicle handling.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Si es true, las ruedas de este eje se alinearán como si estuvieran unidas a
## un eje rígido. Esta configuración no afecta el manejo del vehículo.
@export var rear_beam_axle := false


@export_group("Tires")
## [b][img width=8]res://Assets/UI/EU.png[/img] Contact Patch Length[/b]
## Represents the length of the tire contact patch in the brush tire model.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Representa la longitud de la huella de contacto del neumático en el modelo de neumático de cepillo.
@export var contact_patch := 0.2
## [b][img width=8]res://Assets/UI/EU.png[/img] Braking Grip Multiplier[/b]
## Provides additional longitudinal grip when braking.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Proporciona agarre longitudinal adicional al frenar.
@export var braking_grip_multiplier := 1.5
## [b][img width=8]res://Assets/UI/EU.png[/img] Wheel to Body Torque Multiplier[/b]
## Tire force applied to the ground is also applied to the vehicle body as a
## torque centered on the wheel.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] La fuerza del neumático aplicada al suelo también se aplica a la carrocería del vehículo como un
## torque centrado en la rueda.
@export var wheel_to_body_torque_multiplier := 1.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Tire Stiffnesses (Surface Map)[/b]
## Represents tire stiffness in the brush tire model. Higher values increase
## the responsiveness of the tire.
## Surface detection uses node groups to identify the surface, so make sure
## your staticbodies and rigidbodies belong to one of these groups.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Representa la rigidez del neumático en el modelo de neumático de cepillo. Valores más altos aumentan
## la capacidad de respuesta del neumático.
## La detección de superficie utiliza grupos de nodos para identificar la superficie, así que asegúrate de
## que tus staticbodies y rigidbodies pertenezcan a uno de estos grupos.
@export var tire_stiffnesses := { "Road" : 10.0, "Dirt" : 0.5, "Grass" : 0.5 }
## [b][img width=8]res://Assets/UI/EU.png[/img] Coefficient of Friction (Surface Map)[/b]
## A multiplier for the amount of force a tire can apply based on the surface.
## Surface detection uses node groups to identify the surface, so make sure
## your staticbodies and rigidbodies belong to one of these groups.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Un multiplicador para la cantidad de fuerza que un neumático puede aplicar basándose en la superficie.
## La detección de superficie utiliza grupos de nodos para identificar la superficie, así que asegúrate de
## que tus staticbodies y rigidbodies pertenezcan a uno de estos grupos.
@export var coefficient_of_friction := { "Road" : 3.0, "Dirt" : 2.4, "Grass" : 2.0 }
## [b][img width=8]res://Assets/UI/EU.png[/img] Rolling Resistance (Surface Map)[/b]
## A multiplier for the amount of rolling resistance force based on the surface.
## Surface detection uses node groups to identify the surface, so make sure
## your staticbodies and rigidbodies belong to one of these groups.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Un multiplicador para la cantidad de fuerza de resistencia a la rodadura basándose en la superficie.
## La detección de superficie utiliza grupos de nodos para identificar la superficie, así que asegúrate de
## que tus staticbodies y rigidbodies pertenezcan a uno de estos grupos.
@export var rolling_resistance := { "Road" : 1.0, "Dirt" : 2.0, "Grass" : 4.0 }
## [b][img width=8]res://Assets/UI/EU.png[/img] Lateral Grip Assist (Surface Map)[/b]
## A multiplier to provide more grip based on the amount of lateral wheel slip.
## This can be used to keep vehicles from sliding a long distance, but may provide
## unrealistically high amounts of grip.
## Surface detection uses node groups to identify the surface, so make sure
## your staticbodies and rigidbodies belong to one of these groups.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Un multiplicador para proporcionar más agarre basándose en la cantidad de deslizamiento lateral de las ruedas.
## Esto puede usarse para evitar que los vehículos se deslicen largas distancias, pero puede proporcionar
## cantidades de agarre poco realistas.
@export var lateral_grip_assist := { "Road" : 0.05, "Dirt" : 0.0, "Grass" : 0.0}
## [b][img width=8]res://Assets/UI/EU.png[/img] Longitudinal Grip Ratio (Surface Map)[/b]
## A multiplier to adjust longitudinal grip to differ from lateral grip.
## Useful for allowing vehicles to have wheel spin and maintain high lateral grip.
## Surface detection uses node groups to identify the surface, so make sure
## your staticbodies and rigidbodies belong to one of these groups.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Un multiplicador para ajustar el agarre longitudinal para que difiera del agarre lateral.
## Útil para permitir que los vehículos tengan deslizamiento de ruedas y mantengan un alto agarre lateral.
@export var longitudinal_grip_ratio := { "Road" : 0.5, "Dirt": 0.5, "Grass" : 0.5}
@export_subgroup("Front Axle", "front_")
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Tire Radius (m)[/b]
## Tire radius in meters[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Radio del neumático en metros.
@export var front_tire_radius := 0.3
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Tire Width (mm)[/b]
## Tire width in millimeters. The width doesn't directly affect tire friction,
## but reduces the effects of tire load sensitivity.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Ancho del neumático en milímetros. El ancho no afecta directamente la fricción del neumático,
## pero reduce los efectos de la sensibilidad a la carga del neumático.
@export var front_tire_width := 245.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Front Wheel Mass (kg)[/b]
## Wheel mass in kilograms.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Masa de la rueda en kilogramos.
@export var front_wheel_mass := 15.0
@export_subgroup("Rear Axle", "rear_")
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear Tire Radius (m)[/b]
## Tire radius in meters[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Radio del neumático en metros.
@export var rear_tire_radius := 0.3
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear Tire Width (mm)[/b]
## Tire width in millimeters. The width doesn't directly affect tire friction,
## but reduces the effects of tire load sensitivity.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Ancho del neumático en milímetros. El ancho no afecta directamente la fricción del neumático,
## pero reduce los efectos de la sensibilidad a la carga del neumático.
@export var rear_tire_width := 245.0
## [b][img width=8]res://Assets/UI/EU.png[/img] Rear Wheel Mass (kg)[/b]
## Wheel mass in kilograms.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Masa de la rueda en kilogramos.
@export var rear_wheel_mass := 15.0


@export_group("Aerodynamics")
## [b][img width=8]res://Assets/UI/EU.png[/img] Drag Coefficient[/b]
## The drag coefficient quantifies how much [b]drag[/b] (force against thrust)
## the vehicle receives when moving through air. In the drag equation,
## a lower drag coefficient means the vehicle will experience less drag
## force, allowing it to move faster.
## [br]Typically, the drag coefficient is assumed from the shape of the
## body, where more teardrop-shaped bodies experience a lower drag coefficient.
## Un-streamlined cylindrical bodies have a drag coefficient of
## around [code]0.80[/code], while more streamlined teardrop-shaped bodies
## can have a drag coefficient as low as [code]0.05[/code], or even lower.
## [br]As a more relevant example, most cars have drag coefficients
## around [code]0.40[/code].[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Coeficiente de Arrastre
## El coeficiente de arrastre cuantifica cuánto [b]arrastre[/b] (fuerza contra el empuje)
## recibe el vehículo al moverse por el aire. En la ecuación de arrastre,
## un coeficiente de arrastre más bajo significa que el vehículo experimentará menos fuerza de arrastre, permitiéndole moverse más rápido.
## [br]Típicamente, el coeficiente de arrastre se asume a partir de la forma del
## cuerpo, donde los cuerpos con forma de lágrima experimentan un coeficiente de arrastre más bajo.
## Los cuerpos cilíndricos no aerodinámicos tienen un coeficiente de arrastre de
## alrededor de [code]0.80[/code], mientras que los cuerpos con forma de lágrima más aerodinámicos
## pueden tener un coeficiente de arrastre tan bajo como [code]0.05[/code], o incluso menos.
## [br]Como ejemplo más relevante, la mayoría de los coches tienen coeficientes de arrastre
## alrededor de [code]0.40[/code].
@export var coefficient_of_drag := 0.3
## [b][img width=8]res://Assets/UI/EU.png[/img] Air Density[/b]
## From [url=https://www.grc.nasa.gov/www/k-12/VirtualAero/BottleRocket/airplane/density.html#:~:text=Halving%20the%20density%20halves%20the,above%20which%20it%2cannot%20fly.]NASA[/url]:
## [i]"Halving the density halves the lift, halving the density halves the drag. The [lb]air[rb] density depends on the type of [lb]air[rb] and the depth of the [lb]air[rb]. In the atmosphere, air density decreases as altitude increases. This explains why airplanes have a flight ceiling, an altitude above which it cannot fly."[/i].[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Densidad del Aire
## De [url=https://www.grc.nasa.gov/www/k-12/VirtualAero/BottleRocket/airplane/density.html#:~:text=Halving%20the%20density%20halves%20the,above%20which%20it%2cannot%20fly.]NASA[/url]:
## [i]"Reducir la densidad a la mitad reduce la sustentación a la mitad, reducir la densidad a la mitad reduce el arrastre a la mitad. La densidad del aire depende del tipo de aire y de la profundidad del aire. En la atmósfera, la densidad del aire disminuye a medida que aumenta la altitud. Esto explica por qué los aviones tienen un techo de vuelo, una altitud por encima de la cual no pueden volar."[/i]
@export var air_density := 1.225
## [b][img width=8]res://Assets/UI/EU.png[/img] Frontal Area (m²)[/b]
## The amount of surface area the front-facing part of the vehicle has,
## in meters squared ([code]m^2[/code]).
## [br][br]
## [b]Note:[/b] You do not have to calculate this value to be exact,
## a rough estimate - or even something completely different, depending
## on the result you want - will do.[br][br]
## [img width=8]res://Assets/UI/ESP.png[/img] Área Frontal (m²)
## La cantidad de área de superficie que tiene la parte frontal del vehículo,
## en metros cuadrados ([code]m^2[/code]).
## [br][br]
## [b]Nota:[/b] No tienes que calcular este valor de forma exacta,
## una estimación aproximada - o incluso algo completamente diferente, dependiendo
## del resultado que desees - será suficiente.
@export var frontal_area := 2.0


const ANGULAR_VELOCITY_TO_RPM := 60.0 / TAU

var wheel_array : Array[Wheel] = []
var axles : Array[Axle] = []
var front_axle : Axle
var rear_axle : Axle
var drive_wheels : Array[Wheel] = []

var throttle_input := 0.0
var steering_input := 0.0
var brake_input := 0.0
var handbrake_input := 0.0
var clutch_input := 0.0

var is_ready := false
var local_velocity := Vector3.ZERO
var previous_global_position := Vector3.ZERO
var speed := 0.0
var motor_rpm := 0.0

var steering_amount := 0.0
var steering_exponent_amount := 0.0
var true_steering_amount := 0.0
var throttle_amount := 0.0
var brake_amount := 0.0
var clutch_amount := 0.0
var current_gear := 0
var requested_gear := 0
var torque_output := 0.0
var clutch_torque := 0.0
var max_clutch_torque := 0.0
var drive_axles_inertia := 0.0
var complete_shift_delta_time := 0.0
var last_shift_delta_time := 0.0
var average_drive_wheel_radius := 0.0
var current_torque_split := 0.0
var true_torque_split := 0.0
var brake_force := 0.0
var max_brake_force := 0.0
var handbrake_force := 0.0
var max_handbrake_force := 0.0
var is_braking := false
var motor_is_redline := false
var is_shifting := false
var is_up_shifting := false
var need_clutch := false
var tcs_active := false
var stability_active := false
var stability_yaw_torque := 0.0
var stability_torque_vector := Vector3.ZERO
var front_axle_position := Vector3.ZERO
var rear_axle_position := Vector3.ZERO

var delta_time := 0.0

var vehicle_inertia : Vector3
var current_gravity : Vector3

class Axle:
	var wheels : Array[Wheel] = []
	var is_drive_axle := false
	var inertia := 0.0
	var handbrake := false
	var brake_bias := 0.5
	var rotation_split := 0.5
	var applied_split := 0.5
	var torque_vectoring := 0.0
	var suspension_compression_left := 0.0
	var suspension_compression_right := 0.0
	var tire_size_correction := 0.0
	var differential_lock_torque := 0.0
	
	func get_spin() -> float:
		var spin := 0.0
		for wheel in wheels:
			spin = maxf(spin, wheel.spin)
		return spin * tire_size_correction
	
	func get_average_spin() -> float:
		var spin := 0.0
		for wheel in wheels:
			spin += wheel.spin
		return spin / wheels.size()
	
	func get_max_wheel_slip_y() -> float:
		var slip := 0.0
		for wheel in wheels:
			slip = maxf(slip, wheel.slip_vector.y)
		return slip

func _ready():
	_apply_preset_if_needed()
	initialize()

func initialize():
	if tire_stiffnesses.size() == 0:
		push_error("No surface types provided for tire stiffness")
		return
	
	if coefficient_of_friction.size() == 0:
		push_error("No surface types provided for coefficient of friction")
		return
	
	if rolling_resistance.size() == 0:
		push_error("No surface types provided in rolling resistance")
		return
	
	if lateral_grip_assist.size() == 0:
		push_error("No surface types provided in lateral grip assist")
		return
	
	if longitudinal_grip_ratio.size() == 0:
		push_error("No surface types provided in longitudinal grip ratio")
		return
	
	var default_surface : String = tire_stiffnesses.keys()[0]
	
	center_of_mass_mode = RigidBody3D.CENTER_OF_MASS_MODE_CUSTOM
	mass = vehicle_mass
	var center_of_gravity := calculate_center_of_gravity(front_weight_distribution)
	center_of_gravity.y += center_of_gravity_height_offset
	center_of_mass = center_of_gravity
	max_clutch_torque = max_torque * max_clutch_torque_ratio
	
	front_axle = Axle.new()
	front_axle.wheels.append(front_left_wheel)
	front_axle.wheels.append(front_right_wheel)
	front_axle.torque_vectoring = front_torque_vectoring
	front_left_wheel.opposite_wheel = front_right_wheel
	front_left_wheel.beam_axle = 1.0 if front_beam_axle else 0.0
	front_right_wheel.opposite_wheel = front_left_wheel
	front_right_wheel.beam_axle = -1.0 if front_beam_axle else 0.0
	
	rear_axle = Axle.new()
	rear_axle.wheels.append(rear_left_wheel)
	rear_axle.wheels.append(rear_right_wheel)
	rear_axle.torque_vectoring = rear_torque_vectoring
	rear_left_wheel.opposite_wheel = rear_right_wheel
	rear_left_wheel.beam_axle = 1.0 if rear_beam_axle else 0.0
	rear_right_wheel.opposite_wheel = rear_left_wheel
	rear_right_wheel.beam_axle = -1.0 if rear_beam_axle else 0.0
	rear_axle.handbrake = true
	
	axles.clear()
	axles.append(front_axle)
	axles.append(rear_axle)
	
	wheel_array.clear()
	wheel_array.append(front_left_wheel)
	wheel_array.append(front_right_wheel)
	wheel_array.append(rear_left_wheel)
	wheel_array.append(rear_right_wheel)

	var extra_axle_count = int(extra_wheels.size() / 2.0)
	
	for i in range(extra_axle_count):
		var extra_axle = Axle.new()
		var left_idx = i * 2
		var right_idx = (i * 2) + 1
		
		var w_left = extra_wheels[left_idx]
		var w_right = extra_wheels[right_idx]
		
		extra_axle.wheels.append(w_left)
		extra_axle.wheels.append(w_right)
		extra_axle.torque_vectoring = rear_torque_vectoring
		extra_axle.handbrake = true 
		
		w_left.opposite_wheel = w_right
		w_left.beam_axle = 1.0 if rear_beam_axle else 0.0
		w_right.opposite_wheel = w_left
		w_right.beam_axle = -1.0 if rear_beam_axle else 0.0
		
		axles.append(extra_axle)
		wheel_array.append(w_left)
		wheel_array.append(w_right)
	
	var max_tire_radius := maxf(front_tire_radius, rear_tire_radius)
	front_axle.tire_size_correction = max_tire_radius / front_tire_radius
	rear_axle.tire_size_correction = max_tire_radius / rear_tire_radius
	
	for i in range(2, axles.size()):
		axles[i].tire_size_correction = max_tire_radius / rear_tire_radius
		axles[i].differential_lock_torque = rear_locking_differential_engage_torque
	
	front_axle.differential_lock_torque = front_locking_differential_engage_torque
	rear_axle.differential_lock_torque = rear_locking_differential_engage_torque
	
	for wheel in wheel_array:
		wheel.surface_type = default_surface
		wheel.tire_stiffnesses = tire_stiffnesses
		wheel.contact_patch = contact_patch
		wheel.braking_grip_multiplier = braking_grip_multiplier
		wheel.coefficient_of_friction = coefficient_of_friction
		wheel.rolling_resistance = rolling_resistance
		wheel.lateral_grip_assist = lateral_grip_assist
		wheel.longitudinal_grip_ratio = longitudinal_grip_ratio
		wheel.wheel_to_body_torque_multiplier = wheel_to_body_torque_multiplier
	
	var front_weight_per_wheel := vehicle_mass * front_weight_distribution * 4.9
	var front_spring_rate := calculate_spring_rate(front_weight_per_wheel, front_spring_length, front_resting_ratio)
	var front_damping_rate := calculate_damping(front_weight_per_wheel, front_spring_rate, front_damping_ratio)
	
	for wheel in front_axle.wheels:
		wheel.wheel_mass = front_wheel_mass
		wheel.tire_radius = front_tire_radius
		wheel.tire_width = front_tire_width
		wheel.steering_ratio = front_steering_ratio
		wheel.spring_length = front_spring_length
		wheel.spring_rate = front_spring_rate
		wheel.antiroll = front_spring_rate * front_arb_ratio
		wheel.slow_bump = front_damping_rate * front_bump_damp_multiplier
		wheel.slow_rebound = front_damping_rate * front_rebound_damp_multiplier
		wheel.fast_bump = front_damping_rate * front_bump_damp_multiplier * 0.5
		wheel.fast_rebound = front_damping_rate * front_rebound_damp_multiplier * 0.5
		wheel.bump_stop_multiplier = front_bump_stop_multiplier
		wheel.mass_over_wheel = vehicle_mass * front_weight_distribution * 0.5
		wheel.abs_pulse_time = front_abs_pulse_time
		wheel.abs_spin_difference_threshold = -absf(front_abs_spin_difference_threshold)
	
	var rear_weight_per_wheel := vehicle_mass * (1.0 - front_weight_distribution) * 4.9
	var rear_spring_rate := calculate_spring_rate(rear_weight_per_wheel, rear_spring_length, rear_resting_ratio)
	var rear_damping_rate := calculate_damping(rear_weight_per_wheel, rear_spring_rate, rear_damping_ratio)
	
	for wheel in rear_axle.wheels:
		wheel.wheel_mass = rear_wheel_mass
		wheel.tire_radius = rear_tire_radius
		wheel.tire_width = rear_tire_width
		wheel.steering_ratio = rear_steering_ratio
		wheel.spring_length = rear_spring_length
		wheel.spring_rate = rear_spring_rate
		wheel.antiroll = rear_spring_rate * rear_arb_ratio
		wheel.slow_bump = rear_damping_rate * rear_bump_damp_multiplier
		wheel.slow_rebound = rear_damping_rate * rear_rebound_damp_multiplier
		wheel.fast_bump = rear_damping_rate * rear_bump_damp_multiplier * 0.5
		wheel.fast_rebound = rear_damping_rate * rear_rebound_damp_multiplier * 0.5
		wheel.bump_stop_multiplier = rear_bump_stop_multiplier
		wheel.mass_over_wheel = vehicle_mass * (1.0 - front_weight_distribution) * 0.5
		wheel.abs_pulse_time = rear_abs_pulse_time
		wheel.abs_spin_difference_threshold = -absf(rear_abs_spin_difference_threshold)

	for i in range(2, axles.size()):
		var extra_axle_ref = axles[i]
		for wheel in extra_axle_ref.wheels:
			wheel.wheel_mass = rear_wheel_mass
			wheel.tire_radius = rear_tire_radius
			wheel.tire_width = rear_tire_width
			wheel.steering_ratio = rear_steering_ratio
			wheel.spring_length = rear_spring_length
			wheel.spring_rate = rear_spring_rate
			wheel.antiroll = rear_spring_rate * rear_arb_ratio
			wheel.slow_bump = rear_damping_rate * rear_bump_damp_multiplier
			wheel.slow_rebound = rear_damping_rate * rear_rebound_damp_multiplier
			wheel.fast_bump = rear_damping_rate * rear_bump_damp_multiplier * 0.5
			wheel.fast_rebound = rear_damping_rate * rear_rebound_damp_multiplier * 0.5
			wheel.bump_stop_multiplier = rear_bump_stop_multiplier
			wheel.mass_over_wheel = vehicle_mass * (1.0 - front_weight_distribution) * 0.5
			wheel.abs_pulse_time = rear_abs_pulse_time
			wheel.abs_spin_difference_threshold = -absf(rear_abs_spin_difference_threshold)
	

	var wheel_base := rear_left_wheel.position.z - front_left_wheel.position.z
	var front_track_width := front_right_wheel.position.x - front_left_wheel.position.x
	var front_ackermann := (atan((wheel_base * tan(max_steering_angle)) / (wheel_base - (front_track_width * 0.5 * tan(max_steering_angle)))) / max_steering_angle) - 1.0
	var rear_track_width := rear_right_wheel.position.x - rear_left_wheel.position.x
	var rear_ackermann := (atan((wheel_base * tan(max_steering_angle)) / (wheel_base - (rear_track_width * 0.5 * tan(max_steering_angle)))) / max_steering_angle) - 1.0
	
	front_left_wheel.ackermann = front_ackermann
	front_left_wheel.rotation.z = -front_camber
	front_left_wheel.toe = -front_toe
	front_right_wheel.ackermann = -front_ackermann
	front_right_wheel.rotation.z = front_camber
	front_right_wheel.toe = front_toe
	rear_left_wheel.ackermann = rear_ackermann
	rear_left_wheel.rotation.z = -rear_camber
	rear_left_wheel.toe = -rear_toe
	rear_right_wheel.ackermann = -rear_ackermann
	rear_right_wheel.rotation.z = rear_camber
	rear_right_wheel.toe = rear_toe
	

	for i in range(2, axles.size()):
		var ax = axles[i]
		ax.wheels[0].ackermann = rear_ackermann
		ax.wheels[0].rotation.z = -rear_camber
		ax.wheels[0].toe = -rear_toe
		ax.wheels[1].ackermann = -rear_ackermann
		ax.wheels[1].rotation.z = rear_camber
		ax.wheels[1].toe = rear_toe

	if front_brake_bias < 0.0:
		var front_axle_spring_force := calculate_axle_spring_force(0.6, front_spring_length, front_spring_rate)
		var total_spring_froce := front_axle_spring_force + calculate_axle_spring_force(0.4, rear_spring_length, rear_spring_rate)
		front_brake_bias = front_axle_spring_force / total_spring_froce
	
	front_axle.brake_bias = front_brake_bias
	rear_axle.brake_bias = 1.0 - front_brake_bias
	
	for i in range(2, axles.size()):
		axles[i].brake_bias = 1.0 - front_brake_bias
	
	for wheel in wheel_array:
		wheel.initialize()
	
	if front_torque_split > 0.0 or variable_torque_split:
		front_axle.is_drive_axle = true
	if front_torque_split < 1.0 or variable_torque_split:
		rear_axle.is_drive_axle = true
	

	for wheel in front_axle.wheels:
		front_axle.inertia += wheel.wheel_moment
		if front_axle.is_drive_axle:
			drive_axles_inertia += wheel.wheel_moment
			drive_wheels.append(wheel)
			wheel.is_driven = true
			average_drive_wheel_radius += wheel.tire_radius
	
	for wheel in rear_axle.wheels:
		rear_axle.inertia += wheel.wheel_moment
		if rear_axle.is_drive_axle:
			drive_axles_inertia += wheel.wheel_moment
			drive_wheels.append(wheel)
			wheel.is_driven = true
			average_drive_wheel_radius += wheel.tire_radius

	for i in range(2, axles.size()):
		for wheel in axles[i].wheels:
			axles[i].inertia += wheel.wheel_moment

	average_drive_wheel_radius /= drive_wheels.size()
	previous_global_position = global_position
	
	calculate_brake_force()
	is_ready = true

func _physics_process(delta : float) -> void:
	if not is_ready:
		return

	if not vehicle_inertia:
		var rigidbody_inertia := PhysicsServer3D.body_get_direct_state(get_rid()).inverse_inertia.inverse()
		if rigidbody_inertia.is_finite():
			vehicle_inertia = rigidbody_inertia * inertia_multiplier
			inertia = vehicle_inertia
	
	delta_time += delta
	local_velocity = lerp(((global_transform.origin - previous_global_position) / delta) * global_transform.basis, local_velocity, 0.5)
	previous_global_position = global_position
	speed = local_velocity.length()
	
	if not engine_on:
		for wheel in drive_wheels:
				wheel.spin = 0.0
		
		if engine_on and not engine_was_on:
			motor_rpm = idle_rpm 
		elif not engine_on and engine_was_on:
			need_clutch = true
		
		engine_was_on = engine_on

	if is_instance_valid(extra_features):
			extra_features.process_nitro(delta)
			extra_features.process_speedbreaker(delta)

	process_drag()
	process_braking(delta)
	process_steering(delta)
	process_throttle(delta)
	process_motor(delta)
	process_clutch(delta)
	process_transmission()
	process_drive(delta)
	
	_update_wheel_states()
	
	process_forces(delta)
	process_stability()

func _integrate_forces(state : PhysicsDirectBodyState3D):
	current_gravity = state.total_gravity

func _update_wheel_states():
	var all_wheels = [front_left_wheel, front_right_wheel, rear_left_wheel, rear_right_wheel]
	all_wheels.append_array(extra_wheels)	
	var handbrake_is_active = handbrake_input > 0.1 and engine_on
	
	for wheel in all_wheels:
		if not is_instance_valid(wheel): continue
		wheel.handbrake_active = handbrake_is_active

func process_drag() -> void:
	var drag := 0.5 * air_density * pow(speed, 2.0) * frontal_area * coefficient_of_drag
	if drag > 0.0:
		apply_central_force(-linear_velocity.normalized() * drag)

func process_braking(delta : float) -> void:
	if (brake_input < brake_amount):
		brake_amount -= braking_speed * delta
		if (brake_input > brake_amount):
			brake_amount = brake_input
	
	elif (brake_input > brake_amount):
		brake_amount += braking_speed * delta
		if (brake_input < brake_amount):
			brake_amount = brake_input
	
	if brake_amount > 0.0:
		is_braking = true
	else:
		is_braking = false
	
	brake_force = brake_amount * max_brake_force
	handbrake_force = handbrake_input * max_handbrake_force

func process_steering(delta : float) -> void:
	var steer_assist_engaged := false
	var steering_slip := get_max_steering_slip_angle()

	var steer_speed_correction := steering_speed / (speed * steering_speed_decay) / max_steering_angle
	
	if signf(steering_input) != signf(steering_amount):
		steer_speed_correction = countersteer_speed / (speed * steering_speed_decay)

	if absf(steering_slip) > steering_slip_assist:
		steer_assist_engaged = true
	
	if (steering_input < steering_amount):
		if not steer_assist_engaged or steering_slip < 0.0:
			steering_amount -= steer_speed_correction * delta
			if (steering_input > steering_amount):
				steering_amount = steering_input
		else:
			steering_amount += steer_speed_correction * delta
			if (steering_amount > 0.0):
				steering_amount = 0.0
	
	elif (steering_input > steering_amount):
		if not steer_assist_engaged or steering_slip > 0.0:
			steering_amount += steer_speed_correction * delta
			if (steering_input < steering_amount):
				steering_amount = steering_input
		else:
			steering_amount -= steer_speed_correction * delta
			if (steering_amount < 0.0):
				steering_amount = 0.0
				
	var steering_adjust := pow(absf(steering_amount), steering_exponent) * signf(steering_amount)
	
	var steer_correction := (1.0 - absf(steering_adjust)) * clampf(asin(local_velocity.normalized().x), -max_steering_angle, max_steering_angle) * countersteer_assist
	
	if local_velocity.z > -0.5:
		steer_correction = 0
	else:
		steer_correction = steer_correction / -max_steering_angle

	var steer_correction_amount := 1.0
	if signf(steering_adjust + steer_correction) != signf(steering_input) and 1.0 - absf(steering_input) < steer_correction_amount:
		steer_correction_amount = clampf(steer_correction_amount - (steering_speed * delta), 0.0, 1.0)
	else:
		steer_correction_amount = clampf(steer_correction_amount + (steering_speed * delta), 0.0, 1.0)
	
	steer_correction *= steer_correction_amount
	
	true_steering_amount = clampf(steering_adjust + steer_correction, -max_steering_angle, max_steering_angle)
	
	for wheel in wheel_array:
		wheel.steer(steering_adjust + steer_correction, max_steering_angle)

func process_throttle(delta : float) -> void:
	var throttle_delta := throttle_speed * delta
	if (throttle_input < throttle_amount):
		throttle_amount -= throttle_delta
		if (throttle_input > throttle_amount):
			throttle_amount = throttle_input
	elif (throttle_input >= throttle_amount):
		throttle_amount += throttle_delta
		if (throttle_input < throttle_amount):
			throttle_amount = throttle_input

	if motor_is_redline or is_shifting:
		throttle_amount = 0.0

	if not engine_on:
		clutch_amount = 1.0
	else:
		clutch_amount = clutch_input

func process_motor(delta: float) -> void:
	var drag_torque := motor_rpm * motor_drag

	if not engine_on:
		torque_output = 0.0
		drag_torque *= 3.0
		motor_rpm = maxf(motor_rpm - (drag_torque / motor_moment * ANGULAR_VELOCITY_TO_RPM * delta * 2.0), 0.0)
		motor_is_redline = false
		return

	var base_torque := get_torque_at_rpm(motor_rpm) * throttle_amount

	torque_output = base_torque
	torque_output -= drag_torque * (1.0 + (clutch_amount * (1.0 - throttle_amount)))

	var rpm_increase := torque_output / motor_moment

	motor_rpm += ANGULAR_VELOCITY_TO_RPM * delta * rpm_increase

	motor_is_redline = motor_rpm > max_rpm
	motor_rpm = clampf(motor_rpm, idle_rpm, max_rpm)

	if motor_rpm < idle_rpm + 100:
		need_clutch = true
	elif motor_rpm > maxf(clutch_out_rpm, idle_rpm):
		need_clutch = false

func process_clutch(delta : float):
	if current_gear == 0:
		return
		
	if not engine_on:
		for wheel in drive_wheels:
			wheel.spin = 0.0
		clutch_torque = 0.0
		tcs_active = false
		need_clutch = true
		return

	var current_gear_ratio := get_gear_ratio(current_gear)
	var drive_inertia := motor_moment + (pow(absf(current_gear_ratio), 2.0) * gear_inertia) + drive_axles_inertia
	var drive_inertia_R := drive_inertia / (current_gear_ratio * current_gear_ratio)
	var reaction_torque := get_drive_wheels_reaction_torque() / current_gear_ratio
	var speed_difference := (motor_rpm / ANGULAR_VELOCITY_TO_RPM) - (get_drivetrain_spin() * current_gear_ratio)
	
	if speed_difference < 0.0:
		speed_difference = -sqrt(-speed_difference)
	
	var a := (motor_moment * drive_inertia_R * speed_difference) / delta
	var b := motor_moment * reaction_torque
	var c := drive_inertia_R * torque_output
	var clutch_factor := (1.0 - clutch_amount)
	var tcs_torque_reduction := 0.0
	
	clutch_torque = ((a - b + c)/(motor_moment + drive_inertia_R)) * clutch_factor
	clutch_torque = clampf(clutch_torque, -max_clutch_torque * clutch_factor, max_clutch_torque * clutch_factor)

	if traction_control_max_slip > 0.0:
		var slip_y := 0.0
		for axle in axles:
			slip_y = maxf(slip_y, axle.get_max_wheel_slip_y())
		if slip_y > traction_control_max_slip:
			tcs_torque_reduction = torque_output
			clutch_torque = 0.0
			tcs_active = true
		else:
			tcs_active = false
	
	var clutch_reaction_torque := clutch_torque + tcs_torque_reduction
	var new_rpm := motor_rpm - ((ANGULAR_VELOCITY_TO_RPM * delta * clutch_reaction_torque) / motor_moment)
	
	if new_rpm < idle_rpm:
		new_rpm = idle_rpm
	if new_rpm < idle_rpm + 100:
		need_clutch = true
	elif new_rpm > maxf(clutch_out_rpm, idle_rpm):
		need_clutch = false
	if new_rpm > max_rpm * 1.1:
		new_rpm = max_rpm * 1.1
	
	motor_rpm = new_rpm

func process_transmission() -> void:
	if is_shifting:
		if delta_time > complete_shift_delta_time:
			complete_shift()
		return
	
	if automatic_transmission:
		var reversing := false
		var ideal_wheel_spin := speed / average_drive_wheel_radius
		var drivetrain_spin := get_drivetrain_spin()
		var real_wheel_spin := drivetrain_spin * get_gear_ratio(current_gear)
		var current_ideal_gear_rpm := gear_ratios[current_gear - 1] * final_drive * ideal_wheel_spin * ANGULAR_VELOCITY_TO_RPM
		var current_real_gear_rpm := real_wheel_spin * ANGULAR_VELOCITY_TO_RPM
		
		if current_gear == -1:
			reversing = true
		
		if not reversing:
			var previous_gear_rpm := 0.0
			if current_gear - 1 > 0:
				previous_gear_rpm = get_gear_ratio(current_gear - 1) * maxf(drivetrain_spin, ideal_wheel_spin) * ANGULAR_VELOCITY_TO_RPM
			
			
			if current_gear < gear_ratios.size():
				if current_gear > 0:
					if current_ideal_gear_rpm > max_rpm:
						if delta_time - last_shift_delta_time > shift_time:
							shift(1)
					if current_ideal_gear_rpm > max_rpm * 0.8 and current_real_gear_rpm > max_rpm:
						if delta_time - last_shift_delta_time > shift_time:
							shift(1)
				elif current_gear == 0 and motor_rpm > maxf(clutch_out_rpm, idle_rpm):
					shift(1)
			if current_gear - 1 > 0:
				if current_gear > 1 and previous_gear_rpm < 0.75 * max_rpm:
					if delta_time - last_shift_delta_time > shift_time:
						shift(-1)
		
		if absf(current_gear) <= 1 and brake_input > 0.75:
			if not reversing:
				if speed < 1.0 or local_velocity.z > 0.0:
					if delta_time - last_shift_delta_time > shift_time:
						shift(-1)
			else:
				if speed < 1.0 or local_velocity.z < 0.0:
					if delta_time - last_shift_delta_time > shift_time:
						shift(1)

func process_drive(delta : float) -> void:
	var current_gear_ratio := get_gear_ratio(current_gear)
	var drive_torque := 0.0
	var drive_inertia := motor_moment + pow(current_gear_ratio, 2) * gear_inertia
	var is_slipping := get_is_a_wheel_slipping()
	
	if current_gear != 0:
		drive_torque = clutch_torque * current_gear_ratio

	if variable_torque_split:
		if is_slipping and throttle_amount > 0.1:
			current_torque_split = clampf(current_torque_split + (delta / variable_split_speed), 0.0, 1.0)
		else:
			current_torque_split = clampf(current_torque_split - (delta / variable_split_speed), 0.0, 1.0)

	true_torque_split = lerpf(front_torque_split, front_variable_split, current_torque_split)
	var axle_a := front_axle
	var axle_b := rear_axle
	if true_torque_split <= 0.5:
		axle_a = rear_axle
		axle_b = front_axle
	var axle_difference := axle_a.get_spin() - axle_b.get_spin()
	var a : float = (axle_a.inertia * axle_b.inertia * axle_difference) / delta
	var b : float = axle_a.inertia
	var c : float = axle_b.inertia * drive_torque
	var transfer_torque := (a - b + c)/(axle_a.inertia + axle_b.inertia)
	transfer_torque = clampf(transfer_torque, -absf(drive_torque), absf(drive_torque)) * (1.0 - absf((0.5 - true_torque_split) * 2.0))
	var transfer_torque_2 := drive_torque - transfer_torque
	
	process_axle_drive(axle_b, transfer_torque, drive_inertia, delta)
	process_axle_drive(axle_a, transfer_torque_2, drive_inertia, delta)

	for i in range(2, axles.size()):
		process_axle_drive(axles[i], 0.0, 0.5, delta)
	
func process_axle_drive(axle : Axle, torque : float, drive_inertia : float, delta : float) -> void:
	if not axle.is_drive_axle:
		torque = 0.0
		drive_inertia = 0.0
	
	var allow_abs := true
	if axle.handbrake:
		brake_force += handbrake_force
		allow_abs = false
	if axle.is_drive_axle and axle.differential_lock_torque >= 0.0:
		if absf(torque) > axle.differential_lock_torque:
			axle.rotation_split = 0.5 + (axle.torque_vectoring * -steering_input)
			var couple_spin := axle.get_average_spin()
			axle.wheels[0].spin = couple_spin * axle.rotation_split * 2.0
			axle.wheels[1].spin = couple_spin * (1.0 - axle.rotation_split) * 2.0
			axle.rotation_split = (axle.rotation_split * 2.0) - 1.0
		elif torque != 0.0:
			var left_reaction_torque_ratio := -absf((axle.wheels[0].get_reaction_torque()) / torque)
			var right_reaction_torque_ratio := absf((axle.wheels[1].get_reaction_torque()) / torque)
			axle.rotation_split = maxf(axle.rotation_split, left_reaction_torque_ratio)
			axle.rotation_split = minf(axle.rotation_split, right_reaction_torque_ratio)
	
	var rotation_sum := 0.0
	var split := (axle.rotation_split + 1.0) * 0.5
	axle.applied_split = axle.rotation_split
	rotation_sum += axle.wheels[0].process_torque(torque * split, drive_inertia, brake_force * 0.5 * axle.brake_bias, allow_abs, delta)
	rotation_sum += axle.wheels[1].process_torque(torque * (1.0 - split), drive_inertia, brake_force * 0.5 * axle.brake_bias, allow_abs, delta)
	axle.rotation_split = clampf(rotation_sum, -1.0, 1.0)

func process_forces(delta : float) -> void:
	for axle in axles:
		var previous_compression_left : float = axle.suspension_compression_left
		axle.suspension_compression_left = axle.wheels[0].process_forces(axle.suspension_compression_right, is_braking, delta)
		axle.suspension_compression_right = axle.wheels[1].process_forces(previous_compression_left, is_braking, delta)

func process_stability() -> void:
	var is_stability_on := false
	if enable_stability:
		stability_yaw_torque = 0.0
		var plane_xz := Vector2(local_velocity.x, local_velocity.z)
		if plane_xz.y < 0 and plane_xz.length() > 1.0:
			plane_xz = plane_xz.normalized()
			var yaw_angle := 1.0 - absf(plane_xz.dot(Vector2.UP))
			if yaw_angle > stability_yaw_engage_angle and signf(angular_velocity.y) == signf(plane_xz.x):
				stability_yaw_torque = (yaw_angle - stability_yaw_engage_angle) * stability_yaw_strength
				stability_yaw_torque *= vehicle_inertia.y * clampf(absf(angular_velocity.y) - 0.5, 0.0, 1.0)
		
		stability_torque_vector = Vector3.ZERO
		if get_wheel_contact_count() < 3:
			stability_torque_vector = (global_transform.basis.y.cross(Vector3.UP) * vehicle_inertia * stability_upright_spring) + (-angular_velocity * stability_upright_damping)
			apply_torque(stability_torque_vector)
		else:
			stability_yaw_torque *= stability_yaw_ground_multiplier
		
		if stability_yaw_torque:
			is_stability_on = true
			stability_yaw_torque *= signf(-local_velocity.x)
			apply_torque(global_transform.basis.y * stability_yaw_torque)
	
	stability_active = is_stability_on

func manual_shift(count : int) -> void:
	if not automatic_transmission:
		shift(count)

func shift(count : int) -> void:
	if is_shifting:
		return
	requested_gear = current_gear + count
	
	if requested_gear <= gear_ratios.size() and requested_gear >= -1:
		if current_gear == 0:
			complete_shift()
		else:
			complete_shift_delta_time = delta_time + shift_time
			clutch_amount = 1.0
			is_shifting = true
			if count > 0:
				is_up_shifting = true

func complete_shift() -> void:
	if current_gear == -1:
		brake_amount = 0.0
	if requested_gear < current_gear:
		var wheel_spin := speed / average_drive_wheel_radius
		var requested_gear_rpm := gear_ratios[requested_gear - 1] * final_drive * wheel_spin * ANGULAR_VELOCITY_TO_RPM
		motor_rpm = lerpf(motor_rpm, requested_gear_rpm, 0.5)
	current_gear = requested_gear
	last_shift_delta_time = delta_time
	is_shifting = false
	is_up_shifting = false

func get_wheel_contact_count() -> int:
	var contact_count := 0
	for wheel in wheel_array:
		if wheel.is_colliding():
			contact_count += 1
	return contact_count

func get_is_a_wheel_slipping() -> bool:
	var is_slipping := false
	for wheel in drive_wheels:
		if not wheel.limit_spin:
			is_slipping = true
	return is_slipping

func get_drivetrain_spin() -> float:
	if drive_wheels.size() == 0:
		return 0.0
	
	var drive_spin := 0.0
	for wheel in drive_wheels:
		drive_spin += wheel.spin
	
	return drive_spin / drive_wheels.size()

func get_drive_wheels_reaction_torque() -> float:
	var reaction_torque := 0.0
	for wheel in drive_wheels:
		reaction_torque += wheel.force_vector.y * wheel.tire_radius
	return reaction_torque

func get_gear_ratio(gear : int) -> float:
	if gear > 0:
		return gear_ratios[gear - 1] * final_drive
	elif gear == -1:
		return -reverse_ratio * final_drive
	else:
		return 0.0

func get_torque_at_rpm(lookup_rpm : float) -> float:
	
	var effective_max_rpm = max_rpm
	var final_torque = 0.0
	
	if is_instance_valid(extra_features) and extra_features.nitro_active:
		effective_max_rpm *= extra_features.nitro_rpm_multiplier
	
	var rpm_factor = clamp(lookup_rpm / effective_max_rpm, 0.0, 1.0)
	var torque_factor = torque_curve.sample_baked(rpm_factor)
	final_torque = torque_factor * max_torque
	
	if is_instance_valid(extra_features) and extra_features.nitro_active:
		final_torque *= extra_features.nitro_multiplier
		
	return final_torque

func get_max_steering_slip_angle() -> float:
	var steering_slip := 0.0
	for wheel in front_axle.wheels:
		if absf(steering_slip) < absf(wheel.slip_vector.x):
			steering_slip = wheel.slip_vector.x
	return steering_slip

func calculate_average_tire_friction(weight : float, surface : String) -> float:
	var friction := 0.0
	for wheel in wheel_array:
		friction += wheel.get_friction(weight / wheel_array.size(), surface)
	return friction

func calculate_brake_force() -> void:
	var friction := calculate_average_tire_friction(vehicle_mass * 9.8, "Road")
	max_brake_force = ((friction * braking_grip_multiplier) * average_drive_wheel_radius) / wheel_array.size()
	max_handbrake_force = ((friction * braking_grip_multiplier * 0.05) / average_drive_wheel_radius)

func calculate_center_of_gravity(front_distribution : float) -> Vector3:
	front_axle_position = front_left_wheel.position.lerp(front_right_wheel.position, 0.5)
	rear_axle_position = rear_left_wheel.position.lerp(rear_right_wheel.position, 0.5)
	return lerp(rear_axle_position, front_axle_position, front_distribution)

func calculate_spring_rate(weight : float, spring_length : float, resting_ratio : float) -> float:
	var corrected_resting_ratio := (spring_length * resting_ratio) / spring_length
	var target_compression := spring_length * corrected_resting_ratio * 1000.0
	return weight / target_compression

func calculate_damping(weight : float, spring_rate : float, damping_ratio : float) -> float:
	return damping_ratio * 2.0 * sqrt(spring_rate * weight) * 0.01

func calculate_axle_spring_force(compression : float, spring_length : float, spring_rate : float) -> float:
	return spring_length * compression * 1000.0 * spring_rate * 2.0


func _apply_preset_if_needed() -> void:
	if not use_preset or vehicle_preset == null:
		return
	
	var preset = vehicle_preset as VehiclePreset
	
	engine_on = preset.engine_on

	steering_speed = preset.steering_speed
	countersteer_speed = preset.countersteer_speed
	steering_speed_decay = preset.steering_speed_decay
	steering_slip_assist = preset.steering_slip_assist
	countersteer_assist = preset.countersteer_assist
	steering_exponent = preset.steering_exponent
	max_steering_angle = preset.max_steering_angle
	front_steering_ratio = preset.front_steering_ratio
	rear_steering_ratio = preset.rear_steering_ratio
	
	throttle_speed = preset.throttle_speed
	throttle_steering_adjust = preset.throttle_steering_adjust
	braking_speed = preset.braking_speed
	brake_force_multiplier = preset.brake_force_multiplier
	front_brake_bias = preset.front_brake_bias
	traction_control_max_slip = preset.traction_control_max_slip
	front_abs_pulse_time = preset.front_abs_pulse_time
	front_abs_spin_difference_threshold = preset.front_abs_spin_difference_threshold
	rear_abs_pulse_time = preset.rear_abs_pulse_time
	rear_abs_spin_difference_threshold = preset.rear_abs_spin_difference_threshold
	
	enable_stability = preset.enable_stability
	stability_yaw_engage_angle = preset.stability_yaw_engage_angle
	stability_yaw_strength = preset.stability_yaw_strength
	stability_yaw_ground_multiplier = preset.stability_yaw_ground_multiplier
	stability_upright_spring = preset.stability_upright_spring
	stability_upright_damping = preset.stability_upright_damping
	
	max_torque = preset.max_torque
	max_rpm = preset.max_rpm
	idle_rpm = preset.idle_rpm
	torque_curve = preset.torque_curve       
	motor_drag = preset.motor_drag
	motor_brake = preset.motor_brake
	motor_moment = preset.motor_moment
	clutch_out_rpm = preset.clutch_out_rpm
	max_clutch_torque_ratio = preset.max_clutch_torque_ratio
	
	gear_ratios = preset.gear_ratios.duplicate() 
	final_drive = preset.final_drive
	reverse_ratio = preset.reverse_ratio
	shift_time = preset.shift_time
	automatic_transmission = preset.automatic_transmission
	automatic_time_between_shifts = preset.automatic_time_between_shifts
	gear_inertia = preset.gear_inertia
	
	front_torque_split = preset.front_torque_split
	variable_torque_split = preset.variable_torque_split
	front_variable_split = preset.front_variable_split
	variable_split_speed = preset.variable_split_speed
	front_locking_differential_engage_torque = preset.front_locking_differential_engage_torque
	front_torque_vectoring = preset.front_torque_vectoring
	rear_locking_differential_engage_torque = preset.rear_locking_differential_engage_torque
	rear_torque_vectoring = preset.rear_torque_vectoring

	vehicle_mass = preset.vehicle_mass
	front_weight_distribution = preset.front_weight_distribution
	center_of_gravity_height_offset = preset.center_of_gravity_height_offset
	inertia_multiplier = preset.inertia_multiplier

	front_spring_length = preset.front_spring_length
	front_resting_ratio = preset.front_resting_ratio
	front_damping_ratio = preset.front_damping_ratio
	front_bump_damp_multiplier = preset.front_bump_damp_multiplier
	front_rebound_damp_multiplier = preset.front_rebound_damp_multiplier
	front_arb_ratio = preset.front_arb_ratio
	front_camber = preset.front_camber
	front_toe = preset.front_toe
	front_bump_stop_multiplier = preset.front_bump_stop_multiplier
	front_beam_axle = preset.front_beam_axle

	rear_spring_length = preset.rear_spring_length
	rear_resting_ratio = preset.rear_resting_ratio
	rear_damping_ratio = preset.rear_damping_ratio
	rear_bump_damp_multiplier = preset.rear_bump_damp_multiplier
	rear_rebound_damp_multiplier = preset.rear_rebound_damp_multiplier
	rear_arb_ratio = preset.rear_arb_ratio
	rear_camber = preset.rear_camber
	rear_toe = preset.rear_toe
	rear_bump_stop_multiplier = preset.rear_bump_stop_multiplier
	rear_beam_axle = preset.rear_beam_axle

	contact_patch = preset.contact_patch
	braking_grip_multiplier = preset.braking_grip_multiplier
	wheel_to_body_torque_multiplier = preset.wheel_to_body_torque_multiplier
	tire_stiffnesses = preset.tire_stiffnesses.duplicate(true)
	coefficient_of_friction = preset.coefficient_of_friction.duplicate(true)
	rolling_resistance = preset.rolling_resistance.duplicate(true)
	lateral_grip_assist = preset.lateral_grip_assist.duplicate(true)
	longitudinal_grip_ratio = preset.longitudinal_grip_ratio.duplicate(true)
	
	front_tire_radius = preset.front_tire_radius
	front_tire_width = preset.front_tire_width
	front_wheel_mass = preset.front_wheel_mass
	rear_tire_radius = preset.rear_tire_radius
	rear_tire_width = preset.rear_tire_width
	rear_wheel_mass = preset.rear_wheel_mass

	coefficient_of_drag = preset.coefficient_of_drag
	air_density = preset.air_density
	frontal_area = preset.frontal_area
	
	print("[Vehicle] Preset cargado: ", preset.resource_path.get_file())
