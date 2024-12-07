class_name ResearchPart

class ResearchPartClass extends BuildingPart.BuildingPartClass:
		
	func is_point_placeable_ext(tile: Tile.TileClass) -> bool:	
		if tile.type == Tile.TileClass.Type.Empty:
			return true
		return false
	
	# Посмотреть вокруг тайлы, и если есть кристаллы, добавить очки науки в ресурсы
	func do_when_placed() -> void:
		pass
