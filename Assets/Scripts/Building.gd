
class_name Building

class BuildingClass extends Node2D:
	const BuildingPart = preload("res://Assets/Scripts/BuildingPart.gd").BuildingPartClass
	
	enum Type {Base, Module, Observatory, Research, Drill}
	var tile_positions: Array[BuildingPart]
