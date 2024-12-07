extends Button

var build: Building.BuildingClass;
var building_manager: BuildingManager;

# Called when the node enters the scene tree for the first time.
func init(build: Building.BuildingClass, building_manager: BuildingManager):
	self.text = build.building_name;
	self.build = build;
	self.building_manager = building_manager;
	var tile_map = $TileMapLayer
	building_manager.draw_building_to_map(tile_map, Vector2i(1, 1), build)

func _ready() -> void:
	#var tile_map = self.get_child_count()
	#print(self.get_child_count())
	#building_manager.draw_building_to_map(tile_map, Vector2i(1, 1), build)
	pass # Replace with function body.


		# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(self.get_child_count())
	pass
			
func _get_drag_data(position):
	print("dsdasdad")
	return self
