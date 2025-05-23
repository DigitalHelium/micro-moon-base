extends Button

var build: Building.BuildingClass;
var building_manager: BuildingManager;

# Called when the node enters the scene tree for the first time.
func init(build: Building.BuildingClass, building_manager: BuildingManager):
	%name.text = build.building_name
	%cost_energy.text = str(build.cost.energy)
	%cost_metal.text = str(build.cost.metal)
	%cost_poison.text = str(build.cost.science)

	self.build = build;
	self.building_manager = building_manager;
	print(building_manager)
	var tile_map = $TileMapLayer
	building_manager.draw_building_to_store(tile_map, Vector2i(1, 1), build, null, null)


func _ready() -> void:
	#$Button.pressed()
	#$".".pressed.connect(.)
	#var tile_map = self.get_child_count()
	#print(self.get_child_count())
	#building_manager.draw_building_to_map(tile_map, Vector2i(1, 1), build)
	pass # Replace with function body.


		# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

			
func _get_drag_data(position):
	return self


func _on_pressed() -> void:
	if (build == null):
		return;
	#print("press to " + build.building_name)
	#print(building_manager)
	#print(self.building_manager)
	self.building_manager.set_select_building(build);
	pass
	
