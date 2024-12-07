class_name PathPart

class PathPartClass extends BuildingPart.BuildingPartClass:
		
	func is_point_placeable_ext(tile: Tile.TileClass) -> bool:	
		if tile.type == Tile.TileClass.Type.Empty:
			return true
		return false
