class_name BuildingManager 
extends Node

var builds: Dictionary = {}

enum Type {
	RESEARCH_LAB = 0,
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
		_: return null

func initResearchBuild() -> Building.BuildingClass:
	var bulding_cost = Building.BuildingCost.new(1,2,3)
	var building = ResearchBuilding.ResearchBuildingClass.new("Research Center", "DESC", bulding_cost)
	
	var rows = 2
	var columns = 3
	
	var mat = Matrix.MatrixClass.new(rows, columns)
	mat.set_value(0 , 0, BuildingPart.BuildingPartClass.Type.Research)
	mat.set_value(1 , 0, BuildingPart.BuildingPartClass.Type.Path)
	mat.set_value(1 , 1, BuildingPart.BuildingPartClass.Type.Path)
	mat.set_value(1 , 2, BuildingPart.BuildingPartClass.Type.Research)
	
	building.init_building_parts(mat)
	return building
