class_name EnterancePart

class EnterancePartClass extends BuildingPart.BuildingPartClass:
	var atlas_coord_enterance_path = Vector2i(2,3)
	var building_title_id_enterance_path = 1

	func is_point_placeable_ext(tile: Tile.TileClass) -> bool:	
		
		if tile.type == Tile.TileClass.Type.Empty and tile.effects.has(Tile.TileClass.Effect.Elctric):
			return true
		return false
		
	func get_Atlas_coord() -> Vector2i:
		return atlas_coord_enterance_path
		
	func set_Atlas_coord(coords: Vector2i) -> void:
		atlas_coord_enterance_path = coords	
	
	func get_building_title_id() -> int:
		return building_title_id_enterance_path
