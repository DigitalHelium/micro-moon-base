
class_name Tile

class TileClass extends Node:
	enum Effect {Elctric, Wall, Fog, Taken}
	enum Type {Basic, Pit, Crystal, Unavailable, Base, Goal}

	var type: Type
	var effects: Array[Effect]
	
	func _init(type: int, effects: Array):
		self.type = type
		self.effects = []
		for i in effects.size():
			self.effects.append(effects[i])

	var sprite #не факт что нужно
