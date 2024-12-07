extends Node
const resource_manager_class = preload("res://Assets/Scripts/ResourceManager.gd")

var resource_manager = resource_manager_class.new()
@onready var metal_res_label = %MetalResource
@onready var energy_res_label = %EnergyResource
@onready var science_res_label = %ScienceResource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	resource_manager.init_resources()
	resource_manager.add_resource(GameResource.ResourceClass.Type.Metal, 5)
	resource_manager.add_resource(GameResource.ResourceClass.Type.Science, 3)
	updateLabels()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	updateLabels()
	pass

func updateLabels() -> void:
	var metal = resource_manager.get_resource(GameResource.ResourceClass.Type.Metal)
	var energy = resource_manager.get_resource(GameResource.ResourceClass.Type.Energy)
	var science = resource_manager.get_resource(GameResource.ResourceClass.Type.Science)
	metal_res_label.text = str(metal.amount)
	energy_res_label.text = str(energy.amount)
	science_res_label.text = str(science.amount)
	pass
