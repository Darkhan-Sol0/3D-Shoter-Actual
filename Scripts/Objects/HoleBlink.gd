extends OmniLight3D


func _ready():
	light_color = Color.ORANGE
	light_size = 1
	light_energy = 1
	omni_range = 0

func _process(delta):
	omni_range = lerp(omni_range, 5.0, 20 * delta)
	if omni_range >= 4.0:
		queue_free()
