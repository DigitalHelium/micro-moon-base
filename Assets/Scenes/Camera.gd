extends Camera2D

var is_dragging = false
var drag_speed = 0.5 # Скорость 
var last_mouse_position = Vector2()
var min_zoom = 0.5
var max_zoom = 2.0
var zoom_speed = 0.1

@onready var metal_label = %MetalResource
@onready var energy_label = %EnergyResource
@onready var science_label = %ScienceResource

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			is_dragging = event.pressed
			last_mouse_position = event.position
			
	elif event is InputEventMouseMotion and is_dragging:
		var delta = event.position - last_mouse_position
		position -= delta * drag_speed * zoom
		last_mouse_position = event.position
		
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom = Vector2.ONE * clamp(zoom.x - zoom_speed, min_zoom, max_zoom)
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom = Vector2.ONE * clamp(zoom.x + zoom_speed, min_zoom, max_zoom)
