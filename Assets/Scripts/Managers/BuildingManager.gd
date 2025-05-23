class_name BuildingManager 
extends Node

var builds: Dictionary = {}
var select_building: Building.BuildingClass = null; 
enum Type {
	RESEARCH_LAB = 0,
	RESEARCH_P_LAB = 1,
	RESEARCH_2_LAB = 2,
	RESEARCH_2_EX_LAB = 3,
	ONE_POWER_TOWER = 4,
	POWER_TOWER = 5,
	DINAMITE_L = 6,
	DINAMITE_R = 7,
}

func _ready() -> void:
	pass
	
func get_building(base_pose: Vector2i) -> Building.BuildingClass:
	return builds[base_pose]
	
func add_building(base_pose: Vector2i, build: Building.BuildingClass, resource: Dictionary) -> void:
	build.construct(resource)
	builds[base_pose] = build
	print(builds)
	
func set_select_building(build: Building.BuildingClass):
	select_building = build;

func get_select_building() -> Building.BuildingClass:
	return select_building
	
func init_building(type_build: int) -> Building.BuildingClass:
	return getInitBuilding(type_build)

func getInitBuilding(type_build: int) -> Building.BuildingClass:
	match type_build:
		Type.RESEARCH_LAB: return initResearchBuild()
		Type.RESEARCH_P_LAB: return initResearchCenterPBuild()
		Type.RESEARCH_2_LAB: return initResearchCenter2Build()
		Type.RESEARCH_2_EX_LAB: return initResearchCenter2WithExBuild()
		Type.POWER_TOWER: return initPowerTowerBuild()
		Type.ONE_POWER_TOWER: return initOnePowerTowerBuild()
		Type.DINAMITE_L: return initDinamityLBuild()
		Type.DINAMITE_R: return initDinamityRBuild()
		_: return null
	
func initResearchBuild() -> Building.BuildingClass:
	var bulding_cost = Building.BuildingCost.new(1,2,3)
	var building = ResearchBuilding.ResearchBuildingClass.new("Sciene Cent", "DESC", bulding_cost)
	
	var rows = 4
	var columns = 2
	
	var mat = Matrix.MatrixClass.new(rows, columns)
	mat.set_value(0 , 0, {type = BuildingPart.BuildingPartClass.Type.Research, atlas = Vector2i(1, 3) })
	mat.set_value(1 , 0, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(3, 3) })
	mat.set_value(2 , 0, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(3, 0) })
	mat.set_value(2 , 1, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(1, 2) })
	mat.set_value(3 , 1, {type = BuildingPart.BuildingPartClass.Type.Enterance, atlas = Vector2i(3, 4) })
	
	building.init_building_parts(mat)
	return building
	
func initResearchCenterPBuild() -> Building.BuildingClass:
	var bulding_cost = Building.BuildingCost.new(1,2,3)
	var building = ResearchBuilding.ResearchBuildingClass.new("Sciene Cent", "DESC", bulding_cost)
	
	var rows = 4
	var columns = 2
	
	var mat = Matrix.MatrixClass.new(rows, columns)
	mat.set_value(0 , 1, {type = BuildingPart.BuildingPartClass.Type.Enterance, atlas = Vector2i(3, 5) })
	mat.set_value(0 , 0, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(1, 0) })
	mat.set_value(1 , 0, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(3, 3) })
	mat.set_value(2 , 0, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(3, 0) })
	mat.set_value(2 , 1, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(1, 2) })
	mat.set_value(3 , 1, {type = BuildingPart.BuildingPartClass.Type.Research, atlas = Vector2i(4, 3) })
	
	building.init_building_parts(mat)
	return building

func initResearchCenter2Build() -> Building.BuildingClass:
	var bulding_cost = Building.BuildingCost.new(2,4,6)
	var building = ResearchBuilding.ResearchBuildingClass.new("Sciene 2 Cent", "DESC", bulding_cost)
	
	var rows = 4
	var columns = 3
	
	var mat = Matrix.MatrixClass.new(rows, columns)
	mat.set_value(0 , 0, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(1, 0) })
	mat.set_value(1 , 0, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(3, 3) })
	mat.set_value(2 , 0, {type = BuildingPart.BuildingPartClass.Type.Enterance, atlas = Vector2i(3, 4) })
	mat.set_value(0 , 1, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(0, 2) })
	mat.set_value(0 , 2, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(1, 2) })
	mat.set_value(1 , 2, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(3, 3) })
	mat.set_value(2 , 2, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(3, 3) })
	mat.set_value(3 , 2, {type = BuildingPart.BuildingPartClass.Type.Research, atlas = Vector2i(4, 3) })
	
	building.init_building_parts(mat)
	return building
	
func initResearchCenter2WithExBuild() -> Building.BuildingClass:
	var bulding_cost = Building.BuildingCost.new(3,5,6)
	var building = ResearchBuilding.ResearchBuildingClass.new("Sciene 2 Cent with Ex", "DESC", bulding_cost)
	
	var rows = 5
	var columns = 3
	
	var mat = Matrix.MatrixClass.new(rows, columns)
	mat.set_value(0 , 0, {type = BuildingPart.BuildingPartClass.Type.Research, atlas = Vector2i(0, 0) })
	mat.set_value(0 , 1, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(1, 2) })
	mat.set_value(1 , 1, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(3, 3) })
	mat.set_value(2 , 1, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(3, 3) })
	mat.set_value(3 , 1, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(2, 0) })
	mat.set_value(4 , 1, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(3, 2) })
	mat.set_value(4 , 0, {type = BuildingPart.BuildingPartClass.Type.Research, atlas = Vector2i(0, 0) })
	mat.set_value(3 , 2, {type = BuildingPart.BuildingPartClass.Type.Enterance, atlas = Vector2i(3, 5) })
	
	building.init_building_parts(mat)
	return building
	
func initOnePowerTowerBuild() -> Building.BuildingClass:
	var bulding_cost = Building.BuildingCost.new(1,0,2)
	var building = ElectricBuilding.ElectricBuildingClass.new("Power Tower", "DESC", bulding_cost)
	
	var rows = 1
	var columns = 1
	
	var mat = Matrix.MatrixClass.new(rows, columns)
	mat.set_value(0 , 0, {type = BuildingPart.BuildingPartClass.Type.PowerTower, atlas = Vector2i(6, 4) })
	
	building.init_building_parts(mat)
	return building
	
func initPowerTowerBuild() -> Building.BuildingClass:
	var bulding_cost = Building.BuildingCost.new(3,0,4)
	var building = ElectricBuilding.ElectricBuildingClass.new("Power Tower", "DESC", bulding_cost)
	
	var rows = 4
	var columns = 4
	
	var mat = Matrix.MatrixClass.new(rows, columns)
	mat.set_value(0 , 0, {type = BuildingPart.BuildingPartClass.Type.PowerTower, atlas = Vector2i(5, 3) })
	mat.set_value(1 , 3, {type = BuildingPart.BuildingPartClass.Type.PowerTower, atlas = Vector2i(5, 3) })
	mat.set_value(3 , 2, {type = BuildingPart.BuildingPartClass.Type.PowerTower, atlas = Vector2i(5, 3) })
	
	building.init_building_parts(mat)
	return building
	
func initDinamityLBuild() -> Building.BuildingClass:
	var bulding_cost = Building.BuildingCost.new(0,2,3)
	var building = MetalBuilding.MetalBuildingClass.new("Dinamite L", "DESC", bulding_cost)
	
	var rows = 3
	var columns = 1
	
	var mat = Matrix.MatrixClass.new(rows, columns)
	mat.set_value(0 , 0, {type = BuildingPart.BuildingPartClass.Type.Dynamite, atlas = Vector2i(7, 5) })
	mat.set_value(1 , 0, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(0, 5) })
	mat.set_value(2 , 0, {type = BuildingPart.BuildingPartClass.Type.Enterance, atlas = Vector2i(4, 4) })
	
	building.init_building_parts(mat)
	return building
	
func initDinamityRBuild() -> Building.BuildingClass:
	var bulding_cost = Building.BuildingCost.new(0,2,3)
	var building = MetalBuilding.MetalBuildingClass.new("Dinamite R", "DESC", bulding_cost)
	
	var rows = 3
	var columns = 1
	
	var mat = Matrix.MatrixClass.new(rows, columns)
	mat.set_value(2 , 0, {type = BuildingPart.BuildingPartClass.Type.Dynamite, atlas = Vector2i(7, 5) })
	mat.set_value(1 , 0, {type = BuildingPart.BuildingPartClass.Type.Path, atlas = Vector2i(0, 5) })
	mat.set_value(0 , 0, {type = BuildingPart.BuildingPartClass.Type.Enterance, atlas = Vector2i(4, 4) })
	
	building.init_building_parts(mat)
	return building
	
		
func draw_building_to_store(title_map: TileMapLayer, base_pose: Vector2i, building: Building.BuildingClass, error_display_map: TileMapLayer, tile_manager: TileManger):
	var w = 0
	var h = 0
	for part in building.parts:
		var newW = part.point_position.x
		var newH = part.point_position.y
		print(newH,newH)
		if((newW>=w)&&(newH>=h)):
			w = newW
			h = newH
	base_pose.x = 0 - w/2-1
	base_pose.y = 0 - h/2-1
	print(base_pose)
	for part in building.parts:
		var place_pos = base_pose + part.point_position
		title_map.set_cell(place_pos, part.get_building_title_id(), part.get_Atlas_coord())


func draw_building_to_map(title_map: TileMapLayer, base_pose: Vector2i, building: Building.BuildingClass, error_display_map: TileMapLayer, tile_manager: TileManger,  resource_manager: ResourceManager):
	if (building == null):
		return;
	var has_resources = null;
	if (resource_manager):
		has_resources = resource_manager.has_resource(building.cost);
	for part in building.parts:
		var place_pos = base_pose + part.point_position
		title_map.set_cell(place_pos, part.get_building_title_id(), part.get_Atlas_coord())
		if (error_display_map != null && tile_manager != null):
			if (!has_resources):
				error_display_map.set_cell(place_pos, 0, Vector2i(0, 0))
			elif (tile_manager.can_place_object(base_pose, building)):
				error_display_map.set_cell(place_pos, 0, Vector2i(1, 0))
			elif(tile_manager.can_place_part(part, base_pose)):
				error_display_map.set_cell(place_pos, 0, Vector2i(1, 0))
			else:
				error_display_map.set_cell(place_pos, 0, Vector2i(0, 0))

#func update_display_layer(title_map: TileMapLayer, base_pose: Vector2i, building: Building.BuildingClass, tile_manager: TileManger,  resource_manager: ResourceManager):
	#title_map.clear();
	#if (building == null):
		#return;
	#var has_resources = resource_manager.has_resource(building.cost);
	#for part in building.parts:
		#var place_pos = base_pose + part.point_position
		#if (title_map != null && tile_manager != null):
			#if(tile_manager.can_place_part(part, base_pose) && has_resources):
				#title_map.set_cell(place_pos, 0, Vector2i(1, 0))
			#else:
				#title_map.set_cell(place_pos, 0, Vector2i(0, 0))
	#for tile_key in tile_manager.tiles:
		#if (tile_manager.tiles[tile_key].effects.has(Tile.TileClass.Effect.Elctric)):
			#title_map.set_cell(tile_key, 0, Vector2i(1, 0))
			
