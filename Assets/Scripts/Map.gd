extends Node2D

@onready var title_map: TileMapLayer = %rock

const LAYER_ID = 0
const BUILDING_TITLE_ID = 1

var building_mode = false
var tile_manager: TileManger


func _ready() -> void:
	building_mode = true
	tile_manager = TileManger.new(15,10)
	pass
	
	
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("click"):
		var mouse_pos = get_global_mouse_position()
		var title_pos = title_map.local_to_map(mouse_pos)
		place_building(title_pos)
		print("click")
	pass
	
func _process(delta: float) -> void:
	if building_mode:
		update_building_preview()
	

func place_building(base_pose: Vector2i):
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
	
	var can_place = tile_manager.can_place_object(base_pose, building)
	print(can_place)
	if can_place:
		tile_manager.place_object(base_pose, building)
		for part in building.parts:
			var place_pos = base_pose + part.point_position
			title_map.set_cell(place_pos, part.get_building_title_id(), part.get_Atlas_coord())
		
func update_building_preview():
	var mouse_pos = get_global_mouse_position()
	var title_pos = title_map.local_to_map(mouse_pos)


func remove_building():
	#tile_manager.remove_object(base_pose, building)
	#title_map.erase_cell(place_pos)
	pass
