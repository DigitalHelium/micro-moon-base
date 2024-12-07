
class_name TileManger extends Node


# Словарь где ключи - координаты Vector2, а значение - объект типа Tile
var tiles: Dictionary = {} 


func _init(height: int, width: int):
	for i in height:
		for j in width:
			var coordinates = Vector2i(i,j)
			var current_tile = Tile.TileClass.new(Tile.TileClass.Type.Basic, [Tile.TileClass.Effect.Elctric])
			tiles[coordinates] = current_tile
	
	

func is_tile_exist(tile_position: Vector2i) -> bool:
	return tile_position in tiles

func is_tile_placeable(tile_position: Vector2i) -> bool:
	if is_tile_exist(tile_position):
		return tiles[tile_position].type != Tile.TileClass.Type.Unavailable
	return false
	
	
func update_tile_type(tile_position: Vector2i, type: int) -> void:
	if is_tile_exist(tile_position):
		tiles[tile_position].type = type

func has_tile_effect(tile_position: Vector2i, effect: int) -> bool:
	if is_tile_exist(tile_position) and tiles[tile_position].effects.has(effect):
		return true
	return false

func is_tile_type(tile_position: Vector2i, type: int) -> bool:
	if is_tile_exist(tile_position) and tiles[tile_position].type == type:
		return true
	return false
	
func add_tile_effect(tile_position: Vector2i, effect: int) -> void:
	if is_tile_exist(tile_position):
		tiles[tile_position].effects.append(effect)	

func remove_tile_effect(tile_position: Vector2i, effect: int) -> void:
	if is_tile_exist(tile_position):
		tiles[tile_position].effects.erase(effect)	

func can_place_object(position: Vector2i, building: Building.BuildingClass) -> bool:
	for part in building.parts:
		if !is_tile_placeable(position + part.point_position):
			return false
		if !part.is_point_placeable_ext(tiles[position + part.point_position]):
			return false
	return true

func place_object(position: Vector2i, building: Building.BuildingClass) -> void:
	for part in building.parts:
		add_tile_effect(position + part.point_position, Tile.TileClass.Effect.Taken)
	pass

### Здесь нужно у BuildingManeger Попросить координаты всех Part'ов, чтобы их стереть с карты
func remove_object(position: Vector2i, building: Building.BuildingClass) -> void:
	for part in building.parts:
		remove_tile_effect(position + part.point_position, Tile.TileClass.Effect.Taken)
	pass
