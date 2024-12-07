extends Node

var resource_manager = ResourceManager.new()
func _ready():
	resource_manager.init_resources()
	var bulding_cost = Building.BuildingCost.new(1,2,3)
	var building = ResearchBuilding.ResearchBuildingClass.new("Research Center", "DESC", bulding_cost)
	
	
	
	var rows = 2
	var columns = 3
	
	var mat = Matrix.MatrixClass.new(rows, columns)
	mat.set_value(0 , 0, BuildingPart.BuildingPartClass.Type.Enterance)
	mat.set_value(1 , 0, BuildingPart.BuildingPartClass.Type.Path)
	mat.set_value(1 , 1, BuildingPart.BuildingPartClass.Type.Path)
	mat.set_value(1 , 2, BuildingPart.BuildingPartClass.Type.Research)
	
	building.init_building_parts(mat)
	
	
	
	var tile_manager = TileManger.new(15,10)
	print(tile_manager.can_place_object(Vector2i(0,0), building))
	
