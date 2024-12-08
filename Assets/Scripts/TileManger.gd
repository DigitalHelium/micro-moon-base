
class_name TileManger extends Node


# Словарь где ключи - координаты Vector2, а значение - объект типа Tile
var tiles: Dictionary = {} 

var end_tile: Tile.TileClass

func _init(startI:int, startJ:int, height: int, width: int, tile_map: TileMapLayer):
	for i in range(startI, height, 1):
		for j in range(startJ, width, 1):
			var coordinates = Vector2i(i,j)
			var tile_data = tile_map.get_cell_tile_data(coordinates)
			var current_tile
			var effects = []
			
			if tile_data != null:
				var type = tile_data.get_custom_data("Type")
				var effect = tile_data.get_custom_data("Effects")
				effects.append(effect)
				
				# Посмотреть тайлы вокруг, если есть база, то сделать электричество
				current_tile = Tile.TileClass.new(type, effects)
				
				if type == Tile.TileClass.Type.Goal:
					end_tile = current_tile
				#tile_data.get_custom_data("Type")
				#tile_data.get_custom_data("Effects")
			else:
				var neighbor_tiles = tile_map.get_surrounding_cells(coordinates)
				for neighbor_coord in neighbor_tiles:
					var neighbor_tile = tile_map.get_cell_tile_data(neighbor_coord)
					if neighbor_tile != null and neighbor_tile.get_custom_data("Type") == Tile.TileClass.Type.Base:
						effects.append(Tile.TileClass.Effect.Elctric)
				current_tile = Tile.TileClass.new(Tile.TileClass.Type.Basic, effects)
			
			tiles[coordinates] = current_tile
	
	

func is_tile_exist(tile_position: Vector2i) -> bool:
	return tile_position in tiles

func is_tile_placeable(tile_position: Vector2i) -> bool:
	if is_tile_exist(tile_position):
		return tiles[tile_position].type == Tile.TileClass.Type.Basic and \
		!tiles[tile_position].effects.has(Tile.TileClass.Effect.Wall)
	return false
	
	
func update_tile_type(tile_position: Vector2i, type: Tile.TileClass.Type) -> void:
	if is_tile_exist(tile_position):
		tiles[tile_position].type = type

func has_tile_effect(tile_position: Vector2i, effect: Tile.TileClass.Effect) -> bool:
	if is_tile_exist(tile_position) and tiles[tile_position].effects.has(effect):
		return true
	return false

func is_tile_type(tile_position: Vector2i, type: Tile.TileClass.Type) -> bool:
	if is_tile_exist(tile_position) and tiles[tile_position].type == type:
		return true
	return false
	
func add_tile_effect(tile_position: Vector2i, effect: Tile.TileClass.Effect) -> void:
	if is_tile_exist(tile_position):
		tiles[tile_position].effects.append(effect)	

func remove_tile_effect(tile_position: Vector2i, effect: Tile.TileClass.Effect) -> void:
	if is_tile_exist(tile_position):
		tiles[tile_position].effects.erase(effect)	

func can_place_object(position: Vector2i, building: Building.BuildingClass) -> bool:
	var requirement = 0
	for part in building.parts:
		if !is_tile_placeable(position + part.point_position):
			return false
		if(part.check_placement_requirements(tiles[position + part.point_position])):
			requirement += 1
	if requirement == 0:
		return false
	for part in building.parts:
		if !part.is_point_placeable_ext(tiles[position + part.point_position]):
			return false
	return true

func can_place_part(part: BuildingPart.BuildingPartClass, position: Vector2i) -> bool:
	if !is_tile_placeable(position + part.point_position):
		return false
	if !part.check_placement_requirements(tiles[position + part.point_position]):
		return false
	if !part.is_point_placeable_ext(tiles[position + part.point_position]):
		return false
	return true;

func place_object(position: Vector2i, building: Building.BuildingClass) -> void:
	for part in building.parts:
		add_tile_effect(position + part.point_position, Tile.TileClass.Effect.Taken)
	pass

### Здесь нужно у BuildingManeger Попросить координаты всех Part'ов, чтобы их стереть с карты
func remove_object(position: Vector2i, building: Building.BuildingClass) -> void:
	for part in building.parts:
		remove_tile_effect(position + part.point_position, Tile.TileClass.Effect.Taken)
	pass
	

func is_goal_powered() -> bool:
	return end_tile != null and end_tile.effects.has(Tile.TileClass.Effect.Elctric)
