class_name BuildingPart

class BuildingPartClass extends Node2D:
	enum Type {Research, Dynamite, Path, Enterance, PowerTower, Solar, Destroyer}
	const Tile = preload("res://Assets/Scripts/tile.gd").TileClass
	var point_position: Vector2i
	var parent_building: Building
	var is_occupied: bool = false
	
	const INVALID_TERRAIN_TYPES = {}
	
	func is_point_placeable(point: Vector2i, terrain_map: TileMap) -> bool:
		if is_occupied:
			return false
		var terrain_type = terrain_map.get_cell_tile_data(0, point)
		if terrain_type in INVALID_TERRAIN_TYPES:
			return false
			
		# Проверяем, нет ли уже других зданий в этой точке
		for building in get_tree().get_nodes_in_group("buildings"):
			if building.has_part_at_position(point):
				return false
				
		if !check_placement_requirements(point):
			return false
			 
		return true

# Вспомогательный метод потом если надо
	func check_placement_requirements(point: Vector2i) -> bool:
		return true
		
	func set_occupird(occ: bool) -> void:
		is_occupied = occ
