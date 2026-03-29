# Vehicle-Controller

[![Godot Engine](https://img.shields.io/badge/Godot-4.5-%23478cbf?logo=godot-engine&logoColor=white)](https://godotengine.org)
[![Physics: Jolt](https://img.shields.io/badge/Physics-Jolt-green)](https://github.com/godot-jolt/godot-jolt)

[English](#english) | [Español](#español)

---

## English <a name="english"></a>

### 🚗 Project Overview
**P60B40: Godot Drive (4.5)** is a state-of-the-art vehicle simulation project built for **Godot 4.5** using the **Jolt Physics** engine. This project implements a high-fidelity vehicle controller designed for realism, modularity, and ease of use. It goes beyond simple arcade physics, offering a comprehensive suite of automotive simulation features.

### ✨ Key Features
- **Advanced Physics & Jolt Integration**: Optimized for the Jolt Physics engine to ensure stable and high-performance 3D simulations.
- **Brush Tire Model**: Implements a sophisticated tire model that calculates longitudinal and lateral forces based on slip, surface type (Road, Dirt, Grass), and load sensitivity.
- **Comprehensive Stability Systems**: 
    - **ABS (Anti-lock Braking System)**: Prevents wheel lock-up during hard braking.
    - **TCS (Traction Control System)**: Manages engine power to prevent excessive wheel spin.
    - **Stability Control**: Applies corrective yaw torque and upright forces to maintain vehicle orientation.
- **Realistic Drivetrain & Engine**: 
    - Support for **FWD, RWD, and AWD** with variable torque splitting.
    - Simulated **Limited Slip Differentials (LSD)** with torque vectoring.
    - Detailed engine simulation with torque curves, RPM-based drag, and realistic gear shifting.
- **Aerodynamics**: Calculates drag and lift based on frontal area, air density, and speed.
- **Modular Component System**: 
    - **VehiclePresetResource**: Easily save and swap entire vehicle configurations.
    - **ExtraFeatures**: Integrated logic for Nitro, Speedbreaker (slow-mo), and lighting systems.
    - **Support for Multi-Axle**: Compatible with vehicles having more than 4 wheels.
- **Realistic Audio**: A dynamic sound controller that reacts to every mechanical state of the vehicle.

### 🎮 Controls
- **WASD / Arrows**: Steering, Throttle, Brake.
- **Space**: Handbrake.
- **Q / E**: Shift Up / Down (Manual Transmission).
- **T**: Toggle Transmission (Auto/Manual).
- **C**: Clutch / Change Camera.
- **R**: Speedbreaker (Slow-motion effect).
- **Home / Up Arrow**: Nitro.
- **Enter**: Toggle Engine.
- **1 / 2**: Turn Signals (Left/Right).
- **3**: Front Lights.

---

## Español <a name="español"></a>

### 🚗 Resumen del Proyecto
**P60B40: Godot Drive (4.5)** es un proyecto de simulación de vehículos de última generación desarrollado para **Godot 4.5** utilizando el motor de físicas **Jolt Physics**. Este proyecto implementa un controlador de vehículos de alta fidelidad diseñado para el realismo, la modularidad y la facilidad de uso, yendo más allá de las físicas arcade simples.

### ✨ Características Principales
- **Físicas Avanzadas e Integración con Jolt**: Optimizado para el motor Jolt Physics para garantizar simulaciones 3D estables y de alto rendimiento.
- **Modelo de Neumático (Brush Tire Model)**: Implementa un sofisticado modelo que calcula fuerzas longitudinales y laterales basadas en el deslizamiento, el tipo de superficie (Carretera, Tierra, Hierba) y la sensibilidad a la carga.
- **Sistemas de Estabilidad Completos**:
    - **ABS (Sistema Antibloqueo de Frenos)**: Evita que las ruedas se bloqueen durante frenadas bruscas.
    - **TCS (Sistema de Control de Tracción)**: Gestiona la potencia del motor para evitar el patinaje excesivo de las ruedas.
    - **Control de Estabilidad**: Aplica torque de guiñada correctivo y fuerzas de enderezamiento para mantener la orientación del vehículo.
- **Transmisión y Motor Realistas**:
    - Soporte para **FWD, RWD y AWD** con reparto de torque variable.
    - Simulacion de **Diferenciales de Deslizamiento Limitado (LSD)** con vectorización de torque.
    - Simulación detallada del motor con curvas de torque, arrastre basado en RPM y cambios de marcha realistas.
- **Aerodinámica**: Calcula el arrastre y la sustentación en función del área frontal, la densidad del aire y la velocidad.
- **Sistema de Componentes Modular**:
    - **VehiclePresetResource**: Guarda y cambia fácilmente configuraciones completas de vehículos.
    - **ExtraFeatures**: Lógica integrada para Nitro, Speedbreaker (cámara lenta) y sistemas de iluminación.
    - **Soporte Multieje**: Compatible con vehículos de más de 4 ruedas.
- **Audio Realista**: Un controlador de sonido dinámico que reacciona a cada estado mecánico del vehículo.

### 🎮 Controles
- **WASD / Flechas**: Dirección, Acelerador, Freno.
- **Espacio**: Freno de mano.
- **Q / E**: Subir / Bajar marcha (Transmisión Manual).
- **T**: Cambiar Transmisión (Auto/Manual).
- **C**: Embrague / Cambiar Cámara.
- **R**: Speedbreaker (Efecto de cámara lenta).
- **Inicio / Flecha Arriba**: Nitro.
- **Enter**: Encender/Apagar Motor.
- **1 / 2**: Luces de giro (Izquierda/Derecha).
- **3**: Luces delanteras.
