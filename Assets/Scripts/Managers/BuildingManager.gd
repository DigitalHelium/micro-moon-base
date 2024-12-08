class_name BuildingManager 
extends Node

var builds: Dictionary = {}

enum Type {
	RESEARCH_LAB = 0,
	RESEARCH_Z_LAB = 1,
}

func _ready() -> void:
	pass
	
func get_building(base_pose: Vector2i) -> Building.BuildingClass:
	return builds[base_pose]
	
func add_building(base_pose: Vector2i, build: Building.BuildingClass, resource: Dictionary) -> void:
	build.construct(resource)
	builds[base_pose] = build
	print(builds)
	
func init_building(type_build: int) -> Building.BuildingClass:
	return getInitBuilding(type_build)

func getInitBuilding(type_build: int) -> Building.BuildingClass:
	match type_build:
		Type.RESEARCH_LAB: return initResearchBuild()
		Type.RESEARCH_Z_LAB: return initResearchZBuild()
		_: return null

func initResearchBuild() -> Building.BuildingClass:
	var bulding_cost = Building.BuildingCost.new(1,2,3)
	var building = ResearchBuilding.ResearchBuildingClass.new("Research Center", "DESC", bulding_cost)
	
	var rows = 2
	var columns = 3
	
	var mat = Matrix.MatrixClass.new(rows, columns)
	mat.set_value(0 , 0, {type = BuildingPart.BuildingPartClass.Type.Research, atlas = Vector2i(1, 3) })
	mat.set_value(1 , 0, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(3, 0) })
	mat.set_value(1 , 1, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(0, 1) })
	mat.set_value(1 , 2, {type = BuildingPart.BuildingPartClass.Type.Research, atlas = Vector2i(0, 1) })
	
	building.init_building_parts(mat)
	return building
	
func initResearchZBuild() -> Building.BuildingClass:
	var bulding_cost = Building.BuildingCost.new(1,2,3)
	var building = ResearchBuilding.ResearchBuildingClass.new("Research Center With Enternal", "DESC", bulding_cost)
	
	var rows = 4
	var columns = 2
	
	var mat = Matrix.MatrixClass.new(rows, columns)
	mat.set_value(0 , 0, {type = BuildingPart.BuildingPartClass.Type.Research, atlas = Vector2i(1, 3) })
	mat.set_value(1 , 0, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(3, 3) })
	mat.set_value(2 , 0, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(3, 0) })
	mat.set_value(2 , 1, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(1, 2) })
	mat.set_value(3 , 1, {type = BuildingPart.BuildingPartClass.Type.Enterance, atlas = Vector2i(4, 0) })
	
	building.init_building_parts(mat)
	return building


func draw_building_to_map(title_map: TileMapLayer, base_pose: Vector2i, building: Building.BuildingClass, error_display_map: TileMapLayer, tile_manager: TileManger):
	for part in building.parts:
		var place_pos = base_pose + part.point_position
		title_map.set_cell(place_pos, part.get_building_title_id(), part.get_Atlas_coord())
		if (error_display_map != null && tile_manager != null):
			if(tile_manager.can_place_part(part, base_pose)):
				error_display_map.set_cell(place_pos, 0, Vector2i(1, 0))
			else:
				error_display_map.set_cell(place_pos, 0, Vector2i(0, 0))
