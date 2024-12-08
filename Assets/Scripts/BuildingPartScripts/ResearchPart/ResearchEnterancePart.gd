class_name ResearchEnterancePart extends BuildingPart.BuildingPartClass
var building_title_id_enterance_path = 1

func is_point_placeable_ext(tile: Tile.TileClass) -> bool:	
		
	if !tile.effects.has(Tile.TileClass.Effect.Taken) and tile.effects.has(Tile.TileClass.Effect.Elctric):
		return true
	return false
	
func get_building_title_id() -> int:
	return building_title_id_enterance_path
