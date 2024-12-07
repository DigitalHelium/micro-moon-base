
class_name TileManger extends Node

const Tile = preload("res://Assets/Scripts/tile.gd").TileClass
const building_script = preload("res://Assets/Scripts/Building.gd")
const Building = building_script.BuildingClass


# Словарь где ключи - координаты Vector2, а значение - объект типа Tile
var tiles: Dictionary = {} 

func is_tile_exist(tile_position: Vector2) -> bool:
	return tile_position in tiles

func is_tile_placeable(tile_position: Vector2) -> bool:
	if is_tile_exist(tile_position):
		return tiles[tile_position].type != Tile.Type.Unavailable
	return false
	
	
func update_tile_type(tile_position: Vector2, type: int) -> void:
	if is_tile_exist(tile_position):
		tiles[tile_position].type = type
		


func can_place_object(position: Vector2, building: Building) -> bool:
	
	
	
	for enter_position in building.tile_enter_position:
		if !tiles[enter_position].effects.has(Tile.Effect.Elctric):
			return false
		
	for tile_position in building.tile_positions:
		if(!is_tile_placeable(position + tile_position)):
			return false
	return true
	
