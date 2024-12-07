class_name PowerTowerPart

class PowerTowerPartClass extends BuildingPart.BuildingPartClass:

	func check_placement_requirements(tile: Tile.TileClass) -> bool:
		return tile.effects.has(Tile.TileClass.Effect.Elctric)
		
	func is_point_placeable_ext(tile: Tile.TileClass) -> bool:	
		if !tile.effects.has(Tile.TileClass.Effect.Taken):
			return true
		return false
		
	func do_when_placed(position: Vector2i, tile_manager: TileManger, resource_manager: ResourceManager) -> void:
		for i in range(position.x - 1, position.x + 2, 1):
			for j in range(position.y - 1, position.y + 2, 1):
				var current_position = Vector2i(i,j)
				tile_manager.add_tile_effect(current_position, Tile.TileClass.Effect.Elctric)
		pass
