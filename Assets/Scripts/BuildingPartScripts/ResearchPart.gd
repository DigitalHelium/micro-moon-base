class_name ResearchPart

class ResearchPartClass extends BuildingPart.BuildingPartClass:
	var atlas_coord_research = Vector2i(0,0)
	var building_title_id_research = 1
	
	func is_point_placeable_ext(tile: Tile.TileClass) -> bool:	
		if tile.type == Tile.TileClass.Type.Empty:
			return true
		return false
	
	# Посмотреть вокруг тайлы, и если есть кристаллы, добавить очки науки в ресурсы
	func do_when_placed() -> void:
		pass
	
	func get_Atlas_coord() -> Vector2i:
		return atlas_coord_research
		
	func set_Atlas_coord(coords: Vector2i) -> void:
		atlas_coord_research = coords
		
	func get_building_title_id() -> int:
		return building_title_id_research
