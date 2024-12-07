class_name DynamitePart

class DynamitePartClass extends BuildingPart.BuildingPartClass:
	var atlas_coord_enterance_path = Vector2i(3,3)
	var building_title_id_enterance_path = 1

	func is_point_placeable_ext(tile: Tile.TileClass) -> bool:	
		if !tile.effects.has(Tile.TileClass.Effect.Taken):
			return true
		return false
	
	func do_when_placed(position: Vector2i, tile_manager: TileManger, resource_manager: ResourceManager) -> void:
		for i in range(position.x - 2, position.x + 3, 1):
			for j in range(position.y - 2, position.y + 3, 1):
				var current_position = Vector2i(i,j)
				if tile_manager.has_tile_effect(current_position, Tile.TileClass.Effect.Wall):
					tile_manager.remove_tile_effect(current_position, Tile.TileClass.Effect.Wall)
					resource_manager.add_resource(GameResource.ResourceClass.Type.Metal, 2)
					pass
				if (i >= -1 and i <= 1) and (j >= -1 and j <= 1):
					tile_manager.add_tile_effect(current_position, Tile.TileClass.Effect.Elctric)
	pass
	
	func get_Atlas_coord() -> Vector2i:
		return atlas_coord_enterance_path
		
	func set_Atlas_coord(coords: Vector2i) -> void:
		atlas_coord_enterance_path = coords	
	
	func get_building_title_id() -> int:
		return building_title_id_enterance_path
