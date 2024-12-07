
class_name Tile

class TileClass extends Node:
	enum Effect {Elctric, Wall, Fog}
	enum Type {Pit, Crystal, Taken, Empty, Unavailable}

	var type: Type
	var effects: Array[Effect]

	var sprite #не факт что нужно
