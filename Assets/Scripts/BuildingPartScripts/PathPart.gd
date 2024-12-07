class_name PathPart

class PathPartClass extends BuildingPart.BuildingPartClass:
	var atlas_coord_path = Vector2i(0,1)
	var building_title_id_path = 1
		
	func is_point_placeable_ext(tile: Tile.TileClass) -> bool:	
		if !tile.effects.has(Tile.TileClass.Effect.Taken):
			return true
		return false
		
	func get_Atlas_coord() -> Vector2i:
		return atlas_coord_path
		
	func set_Atlas_coord(coords: Vector2i) -> void:
		atlas_coord_path = coords
		
	func get_building_title_id() -> int:
		return building_title_id_path
