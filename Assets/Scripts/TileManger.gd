
class_name TileManger extends Node2D

const Tile = preload("res://Assets/Scripts/tile.gd").TileClass
const Building = preload("res://Assets/Scripts/Building.gd").BuildingClass

var tiles: Dictionary = {} 


func update_tile_data(tile_position: Vector2) -> void:
	pass
	
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
	for tile_position in building.tile_positions:
		is_tile_placeable(position + tile_position)
	return false
	
