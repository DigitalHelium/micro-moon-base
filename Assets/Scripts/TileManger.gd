
class_name TileManger extends Node


# Словарь где ключи - координаты Vector2, а значение - объект типа Tile
var tiles: Dictionary = {} 


func _init(height: int, width: int):
	for i in height:
		for j in width:
			var coordinates = Vector2i(i,j)
			var current_tile = Tile.TileClass.new(Tile.TileClass.Type.Empty, [Tile.TileClass.Effect.Elctric])
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
		


func can_place_object(position: Vector2i, building: Building.BuildingClass) -> bool:
	for part in building.parts:
		if !is_tile_placeable(position + part.point_position):
			return false
		if !part.is_point_placeable_ext(tiles[position + part.point_position]):
			return false
	return true
	
