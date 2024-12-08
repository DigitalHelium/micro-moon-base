class_name ResearchPart extends BuildingPart.BuildingPartClass
var building_title_id_research = 1
	
func is_point_placeable_ext(tile: Tile.TileClass) -> bool:	
	if !tile.effects.has(Tile.TileClass.Effect.Taken):
		return true
	return false
	
	# Посмотреть вокруг тайлы, и если есть кристаллы, добавить очки науки в ресурсы
func do_when_placed(position: Vector2i, tile_manager: TileManger, resource_manager: ResourceManager) -> void:
	for i in range(position.x - 1, position.x + 2, 1):
		for j in range(position.y - 1, position.y + 2, 1):
			var current_position = Vector2i(i,j)
			tile_manager.add_tile_effect(current_position, Tile.TileClass.Effect.Elctric)
			if tile_manager.is_tile_type(current_position, Tile.TileClass.Type.Crystal):
				print("yay")
				resource_manager.add_resource(GameResource.ResourceClass.Type.Science, 1)
				pass
	pass
	
	
func get_building_title_id() -> int:
	return building_title_id_research
