class_name GameResource

class ResourceClass extends Node:
	enum Type {Metal, Energy, Science}
	
	var type: Type
	var amount: int = 0
	var max_amount: int = 100
	
	signal amount_changed(new_amount: int)
	signal max_amount_changed(new_max: int)
	signal resource_full()
	signal resource_empty()
	
	func _init(init_type: Type, init_amount: int = 0, init_max: int = 100):
		type = init_type
		amount = init_amount
		max_amount = init_max
	
	func add(value: int) -> bool:
		if value <= 0:
			return false
		var new_amount = mini(amount + value, max_amount)
		if new_amount != amount:
			amount = new_amount
			amount_changed.emit(amount)
			
			if amount >= max_amount:
				resource_full.emit()
			return true
		return false
		
	func subtract(value: int) -> bool:
		if value <= 0:
			return false;
		
		if amount >= value:
			amount -= value
			amount_changed.emit(amount)
			
			if amount == 0:
				resource_empty.emit()
			return true
		return false
	
	func has_amount(value: int) -> bool:
		return amount >= value
	
	func clear() -> void:
		if amount > 0:
			amount = 0
			amount_changed.emit(0)
