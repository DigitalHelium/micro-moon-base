class_name EnterancePart

class EnterancePartClass extends BuildingPart.BuildingPartClass:

	func is_point_placeable_ext(tile: Tile.TileClass) -> bool:	
		
		if tile.type == Tile.TileClass.Type.Empty and tile.effects.has(Tile.TileClass.Effect.Elctric):
			return true
		return false
