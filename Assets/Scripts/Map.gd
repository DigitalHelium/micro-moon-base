extends Node2D

@onready var title_map = %rock

func _ready() -> void:
	pass
	
func _input(event):
	if Input.is_action_just_pressed("click"):
		print("click")
	pass
