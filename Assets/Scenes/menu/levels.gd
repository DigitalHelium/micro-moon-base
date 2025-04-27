extends Node2D


func _on_menu_button_pressed() -> void:
		SceneTransition.change_scene("res://Assets/Scenes/Menu/menu.tscn")


func _on__pressed_1() -> void:
	SceneTransition.change_scene("res://Assets/Scenes/Levels/Level_1.tscn")
	print('1')


func _on__pressed_2() -> void:
	SceneTransition.change_scene("res://Assets/Scenes/Levels/Level_2.tscn")
	print('2')
	pass # Replace with function body.


func _on__pressed_3() -> void:
	print('3')
	pass # Replace with function body.
