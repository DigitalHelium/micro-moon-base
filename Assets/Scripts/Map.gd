extends Node2D

@onready var title_map: TileMapLayer = %rock
@onready var resource_manager_scene = %ResourceManager


const LAYER_ID = 0
const BUILDING_TITLE_ID = 1

var building_mode = false
var resource_manager: ResourceManager
var tile_manager: TileManger
var building_manager: BuildingManager
var select_building_type = 0


func _ready() -> void:
	building_mode = true
	resource_manager = resource_manager_scene.resource_manager
	tile_manager = TileManger.new(15,10)
	building_manager = BuildingManager.new()
	pass
	
	
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("click"):
		var mouse_pos = get_global_mouse_position()
		var title_pos = title_map.local_to_map(mouse_pos)
		place_building(title_pos, select_building_type)
		print("click", title_pos)
	pass
	
func _process(delta: float) -> void:
	if building_mode:
		update_building_preview()
	

func place_building(base_pose: Vector2i, type_build: int):
	var building = building_manager.init_building(type_build)
	var can_place = tile_manager.can_place_object(base_pose, building)
	var has_resources = resource_manager.has_resource(building.cost)
	print(can_place)
	if can_place and has_resources:
		tile_manager.place_object(base_pose, building)
		for part in building.parts:
			var place_pos = base_pose + part.point_position
			title_map.set_cell(place_pos, part.get_building_title_id(), part.get_Atlas_coord())
		building_manager.add_building(base_pose, building, resource_manager.get_resources())
		
func update_building_preview():
	var mouse_pos = get_global_mouse_position()
	var title_pos = title_map.local_to_map(mouse_pos)


func remove_building():
	#tile_manager.remove_object(base_pose, building)
	#title_map.erase_cell(place_pos)
	pass
