extends CanvasLayer

var building_manager: BuildingManager
var store_builds: Dictionary = {}
var selected_tab = 0;
@onready var tab0 = %poison_tab
@onready var tab1 = %energi_tab
@onready var tab2 = %metal_tab

@onready var builds_container = $Control/PanelContainer/HBoxContainer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(building_manager)
	print(building_manager.Type)
	update_store_catalog();
		
	pass # Replace with function body.

func set_building_manager(building_manager: BuildingManager):
	self.building_manager = building_manager

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_store_catalog():
	building_manager.set_select_building(null);
	for child in builds_container.get_children():
		builds_container.remove_child(child)
	for build_item in building_manager.Type:
		if (selected_tab == 0 && [0, 1, 2, 3].has(building_manager.Type[build_item])):
			add_store_item(building_manager.Type[build_item])
		elif (selected_tab == 1 && [4].has(building_manager.Type[build_item])):
			add_store_item(building_manager.Type[build_item])
		elif (selected_tab == 2 && [5, 6].has(building_manager.Type[build_item])):
			add_store_item(building_manager.Type[build_item])
		
func add_store_item(item_type: int):
		var build = building_manager.init_building(item_type);
		var node = preload("res://Assets/Scenes/Store/StoreItem.tscn").instantiate()
		node.init(build, building_manager)
		builds_container.add_child(node);

func _on_poison_tab_pressed() -> void:
	selected_tab = 0;
	tab0.self_modulate = "#00ff33";
	tab1.self_modulate = "#ffffff";
	tab2.self_modulate = "#ffffff";
	update_store_catalog()
	pass # Replace with function body.


func _on_energi_tab_pressed() -> void:
	selected_tab = 1;
	tab1.self_modulate = "#00ff33";
	tab0.self_modulate = "#ffffff";
	tab2.self_modulate = "#ffffff";
	update_store_catalog()
	pass # Replace with function body.


func _on_metal_tab_pressed() -> void:
	selected_tab = 2;
	tab2.self_modulate = "#00ff33";
	tab1.self_modulate = "#ffffff";
	tab0.self_modulate = "#ffffff";
	update_store_catalog()
	pass # Replace with function body.
