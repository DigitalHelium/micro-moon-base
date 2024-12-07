class_name PowerTowerPart

class PowerTowerPartClass extends BuildingPart.BuildingPartClass:

	func check_placement_requirements(tile: Tile.TileClass) -> bool:
		return tile.effects.has(Tile.TileClass.Effect.Elctric)
		
	func is_point_placeable_ext(tile: Tile.TileClass) -> bool:	
		if !tile.effects.has(Tile.TileClass.Effect.Taken):
			return true
		return false
