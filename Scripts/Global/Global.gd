extends Node

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	Engine.max_fps = Engine.physics_ticks_per_second

func _input(event):
	if event is InputEventKey:
		if event.as_text_keycode() == "Escape":
			get_tree().quit()






