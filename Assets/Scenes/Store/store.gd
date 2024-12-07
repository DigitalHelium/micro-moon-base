extends CanvasLayer

var building_manager: BuildingManager
var store_builds: Dictionary = {}

@onready var builds_container = $Control/PanelContainer/HBoxContainer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	building_manager = BuildingManager.new()
	print(building_manager.Type)
	for build_item in building_manager.Type:
		print(building_manager.Type[build_item])
		var build = building_manager.init_building(building_manager.Type[build_item]);
		var node = preload("res://Assets/Scenes/Store/StoreItem.tscn").instantiate()
		node.init(build, building_manager)
		builds_container.add_child(node);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
