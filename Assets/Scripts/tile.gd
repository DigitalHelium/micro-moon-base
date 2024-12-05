
class_name Tile extends Node2D

enum Effect {Elctric, Wall, Fog}
enum Type {Base, Module, Pit, Observatory, Research, Drill, Path, Empty, Unavailable}

var type: Type
var effects: Array[Effect]

var sprite #не факт что нужно
