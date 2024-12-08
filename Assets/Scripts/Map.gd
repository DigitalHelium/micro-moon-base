extends Node2D

@onready var title_map: TileMapLayer = %rock
@onready var display_map: TileMapLayer = %display
@onready var error_display_map: TileMapLayer =  %errorDisplayMap
@onready var resource_manager_scene = %ResourceManager


const LAYER_ID = 0
const BUILDING_TITLE_ID = 1

var building_mode = false
var resource_manager: ResourceManager
var tile_manager: TileManger
var building_manager: BuildingManager
var select_building_type = 0  
#building_manager.type


func _ready() -> void:
	building_mode = true
	resource_manager = resource_manager_scene.resource_manager
	tile_manager = TileManger.new(15,10)
	building_manager = BuildingManager.new()
	#$".".pressed.connection(self.updType($".".building_manager))
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
		building_manager.draw_building_to_map(title_map, base_pose, building, null, null)
		building_manager.add_building(base_pose, building, resource_manager.get_resources())
		
func update_building_preview():
	var mouse_pos = get_global_mouse_position()
	var title_pos = title_map.local_to_map(mouse_pos)
	var building = building_manager.init_building(select_building_type)
	if (display_map != null):
		display_map.clear();
		error_display_map.clear();
		building_manager.draw_building_to_map(display_map, title_pos, building, error_display_map, tile_manager)


func remove_building():
	#tile_manager.remove_object(base_pose, building)
	#title_map.erase_cell(place_pos)
	pass
	
func updType(type):
	#select_building_type = type
	print('connection')
	
	
