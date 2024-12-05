
class_name TileManger extends Node2D

const tile = preload("res://Assets/Scripts/tile.gd")

var tiles: Dictionary = {} 


func update_tile_data(tile_position: Vector2) -> void:
	pass
	
func is_tile_exist(tile_position: Vector2) -> bool:
	return tile_position in tiles

func is_tile_placeable(tile_position: Vector2) -> bool:
	if is_tile_exist(tile_position):
		return tiles[tile_position].type != Tile.Type.Unavailable
	return false
	
	
func update_tile_type(tile_position: Vector2, type: Tile.Type) -> void:
	if is_tile_exist(tile_position):
		tiles[tile_position].type = type
