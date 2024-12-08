class_name ResearchPathPart extends BuildingPart.BuildingPartClass
var building_title_id_path = 1	
		
func is_point_placeable_ext(tile: Tile.TileClass) -> bool:	
	if !tile.effects.has(Tile.TileClass.Effect.Taken):
		return true
	return false
		
		
func get_building_title_id() -> int:
	return building_title_id_path
