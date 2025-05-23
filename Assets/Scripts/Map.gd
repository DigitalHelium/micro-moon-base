extends Node2D

@onready var title_map: TileMapLayer = %rock
@onready var display_map: TileMapLayer = %display
@onready var error_display_map: TileMapLayer =  %errorDisplayMap
@onready var resource_manager_scene = %ResourceManager
@onready var energi_map = %energi


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
	tile_manager = TileManger.new(-100,-100,100,100, title_map)
	building_manager = BuildingManager.new()
	print(building_manager)
	$"../../Store".set_building_manager(building_manager)
	update_energi_layer()
	#$".".pressed.connection(self.updType($".".building_manager))
	pass
	
	
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("click"):
		var mouse_pos = get_global_mouse_position()
		var title_pos = title_map.local_to_map(mouse_pos)
		place_building(title_pos)
		#print("click", title_pos)
	if Input.is_action_just_pressed("right_click"):
		building_manager.set_select_building(null);
	pass
	
func _process(delta: float) -> void:
	if building_mode:
		update_building_preview()
	

func place_building(base_pose: Vector2i):
	var building = building_manager.get_select_building()
	if building == null:
		return
	var can_place = tile_manager.can_place_object(base_pose, building)
	var has_resources = resource_manager.has_resource(building.cost)
	print(can_place)
	if can_place and has_resources:
		tile_manager.place_object(base_pose, building)
		building.do_when_placed(base_pose, tile_manager, resource_manager)
		building_manager.draw_building_to_map(title_map, base_pose, building, null, null, null)
		building_manager.add_building(base_pose, building, resource_manager.get_resources())
		update_energi_layer()
	
	if (tile_manager.is_goal_powered()):
		SceneTransition.change_scene("res://Assets/Scenes/win.tscn")
		
func update_building_preview():
	var mouse_pos = get_global_mouse_position()
	var title_pos = title_map.local_to_map(mouse_pos)
	var building = building_manager.get_select_building()
	if (display_map != null):
		display_map.clear();
		error_display_map.clear()
		building_manager.draw_building_to_map(display_map, title_pos, building, error_display_map, tile_manager, resource_manager)
		#building_manager.update_display_layer(error_display_map, title_pos, building, tile_manager, resource_manager)

func update_energi_layer():
	energi_map.clear();
	for tile_key in tile_manager.tiles:
		if (tile_manager.tiles[tile_key].effects.has(Tile.TileClass.Effect.Elctric)):
			energi_map.set_cell(tile_key, 0, Vector2i(0, 0))
			print(tile_key)

func remove_building():
	#tile_manager.remove_object(base_pose, building)
	#title_map.erase_cell(place_pos)
	pass
	
func updType(type):
	#select_building_type = type
	print('connection')
	
	
