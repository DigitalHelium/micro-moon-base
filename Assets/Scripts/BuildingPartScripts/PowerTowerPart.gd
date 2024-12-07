class_name PowerTowerPart

class PowerTowerPartClass extends BuildingPart.BuildingPartClass:

	func check_placement_requirements(tile: Tile.TileClass) -> bool:
		return tile.effects.has(Tile.TileClass.Effect.Elctric)
		
	func is_point_placeable_ext(tile: Tile.TileClass) -> bool:	
		if tile.type == Tile.TileClass.Type.Empty:
			return true
		return false
