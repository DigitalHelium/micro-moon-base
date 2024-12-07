
class_name Building

class BuildingClass extends Node:
	const BuildingPart = preload("res://Assets/Scripts/BuildingPart.gd").BuildingPartClass
	
	enum Type {Base, Module, Observatory, Research, Drill}
	#: Array[BuildingPart]
	var parts: Array = []
	
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
		
	#инициализирует Building множеством BuildingPart. На вход подается матрица (карта) координат в локальных координатах matrix[i][j] Array[Array[Type]]
	func init_building_parts(building_matrix: Matrix.MatrixClass) -> void:
		for i in building_matrix.get_rows():
			for j in building_matrix.get_columns():
				var value = building_matrix.get_value(i, j)
				#Спрашивает у подкласса какой это тип BuildingPart
				var current_part = init_part_class(value)
					
				if current_part != null:
					current_part.point_position = Vector2i(i, j)
					current_part.parent_building = self
					parts.append(current_part)
		pass
	
	func init_part_class(type: int) -> BuildingPart.BuildingPartClass:
		return null
		
	func do_when_placed(position: Vector2i, tile_manager: TileManger, resource_manager: ResourceManager) -> void:
		for part in parts:
			part.do_when_placed(position + part.point_position, tile_manager, resource_manager)
		pass
	
class BuildingCost:
	var metal: int = 0
	var energy: int = 0
	var science: int = 0
	
	func _init(m: int = 0, e: int = 0, s: int = 0):
		metal = m
		energy = e
		science = s
		
	
