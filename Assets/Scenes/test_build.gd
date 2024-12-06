extends Node2D
const resource_manager_class = preload("res://Assets/Scripts/ResourceManager.gd")

var resource_manager = resource_manager_class.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	resource_manager.init_resources()
	var metal = resource_manager.get_resource(GameResource.ResourceClass.Type.Metal)
	print("METAL: ", metal.amount)
	resource_manager.add_resource(GameResource.ResourceClass.Type.Metal, 3)
	print("METAL: ", metal.amount)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
