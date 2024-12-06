
class_name Building

class BuildingClass extends Node2D:
	const BuildingPart = preload("res://Assets/Scripts/BuildingPart.gd").BuildingPartClass
	
	enum Type {Base, Module, Observatory, Research, Drill}
	var tile_positions: Array[BuildingPart]
	
	var building_name: String = ""
	var description: String = ""
	var cost: BuildingCost
	
	signal construction_complites
	
	func _init(name: String, desc: String, c: BuildingCost):
		building_name = name
		description = desc
		cost = c
		
	# Проверка что можно ставить здание (Нужно будет расширить)
	func can_construct(res: Dictionary) -> bool:
		if res.has("metal") and res["metal"].has_amount(cost.metal) and \
		res.has("energy") and res["energy"].has_amount(cost.energy) and \
		res.has("science") and res["science"].has_amount(cost.science):
			return true
		return false
	
	func construct(res: Dictionary) -> bool:
		if not can_construct(res):
			return false
		res["metal"].subtract(cost.metal)
		res["energy"].subtract(cost.energy)
		res["science"].subtract(cost.science)
		
		construction_complites.emit()
		return true
	
class BuildingCost:
	var metal: int = 0
	var energy: int = 0
	var science: int = 0
	
	func _init(m: int = 0, e: int = 0, s: int = 0):
		metal = m
		energy = e
		science = s
		
	
