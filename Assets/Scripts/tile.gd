
class_name Tile

class TileClass extends Node:
	enum Effect {Elctric, Wall, Fog}
	enum Type {Pit, Crystal, Taken, Empty, Unavailable}

	var type: Type
	var effects: Array[Effect]
	
	func _init(type: int, effects: Array[int]):
		self.type = type
		self.effects = []
		for i in effects.size():
			self.effects.append(effects[i])

	var sprite #не факт что нужно
