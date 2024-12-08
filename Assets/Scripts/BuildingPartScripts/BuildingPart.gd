class_name BuildingPart

class BuildingPartClass extends Node:
	enum Type {Research, Dynamite, Path, Enterance, PowerTower, Solar, Destroyer}
	var point_position: Vector2i
	var parent_building: Building.BuildingClass
	var is_occupied: bool = false
	var atlas_coord = Vector2i(0,0)
	var building_title_id = 1
	
	const INVALID_TERRAIN_TYPES = {}

	func _init(atlas_coord_value: Vector2i) -> void:
		atlas_coord = atlas_coord_value
	
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
				
		#if !check_placement_requirements(point):
		#	return false
			 
		return true

# Вспомогательный метод потом если надо
	func check_placement_requirements(tile: Tile.TileClass) -> bool:
		return true
		
	func set_occupird(occ: bool) -> void:
		is_occupied = occ
		
	func get_Atlas_coord() -> Vector2i:
		return atlas_coord
		
	func set_Atlas_coord(coords: Vector2i) -> void:
		atlas_coord = coords
	
	func get_building_title_id() -> int:
		return building_title_id

	# Наследование жопы
	func is_point_placeable_ext(tile: Tile.TileClass) -> bool:	 
		return false
	
	func do_when_placed(position: Vector2i, tile_manager: TileManger, resource_manager: ResourceManager) -> void:
		#print("do_when_placed() called from BildingPartClass")
		pass
