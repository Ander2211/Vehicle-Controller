extends Node

@onready var grass_type: Node3D = $GrassType
@onready var road_type: Node3D = $RoadType
@onready var dirt_type: Node3D = $DirtType


func _ready() -> void:
	_assign_group_to_children(grass_type, "Grass")
	_assign_group_to_children(road_type,  "Road")
	_assign_group_to_children(dirt_type, "Dirt")

func _assign_group_to_children(parent: Node, group_name: String) -> void:
	if not parent:
		return
	
	var static_bodies := _find_all_staticbodies(parent)
	for body in static_bodies:
		
		# Añadir al grupo correspondiente
		if not body.is_in_group(group_name):
			body.add_to_group(group_name)
		
		# Limpiar otros grupos para que no queden mezclas
		var all_groups := ["Grass", "Road", "Dirt"]
		
		for g in all_groups:
			if g != group_name and body.is_in_group(g):
				body.remove_from_group(g)


func _find_all_staticbodies(node: Node) -> Array[StaticBody3D]:
	var result: Array[StaticBody3D] = []
	
	if node is StaticBody3D:
		result.append(node)
	
	for child in node.get_children():
		result += _find_all_staticbodies(child)
	
	return result
