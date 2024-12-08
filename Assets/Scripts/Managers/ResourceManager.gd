class_name ResourceManager
extends Node

var resource: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	init_resources()
	pass # Replace with function body.
	
func init_resources():
	resource[GameResource.ResourceClass.Type.Metal] = GameResource.ResourceClass.new(
		GameResource.ResourceClass.Type.Metal,
		4,
		100
	)
	resource[GameResource.ResourceClass.Type.Energy] = GameResource.ResourceClass.new(
		GameResource.ResourceClass.Type.Energy,
		4,
		100
	)
	resource[GameResource.ResourceClass.Type.Science] = GameResource.ResourceClass.new(
		GameResource.ResourceClass.Type.Science,
		10,
		100
	)
	
	
func get_resource(type: GameResource.ResourceClass.Type) -> GameResource.ResourceClass:
	return resource[type]
	
func get_resources() -> Dictionary:
	return resource
	
func add_resource(type: GameResource.ResourceClass.Type, amount: int) -> bool:
	return resource[type].add(amount)
	
func subtract_resource(type: GameResource.ResourceClass.Type, amount: int) -> bool:
	return resource[type].subtract(amount)
	
func has_resource(cost: Building.BuildingCost) -> bool:
	if resource[GameResource.ResourceClass.Type.Metal].has_amount(cost.metal) and \
	resource[GameResource.ResourceClass.Type.Energy].has_amount(cost.energy) and \
	resource[GameResource.ResourceClass.Type.Science].has_amount(cost.science):
		return true
	return false
	
