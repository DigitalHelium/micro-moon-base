class_name BuildingPart

class BuildingPartClass extends Node2D:
	enum Type {Research, Dynamite, Path, Enterance, PowerTower, Solar, Destroyer}
	const Tile = preload("res://Assets/Scripts/tile.gd").TileClass
	var point_position: Vector2
	
	func is_point_placeable(tile: Tile):
		print('jopa')
		pass
