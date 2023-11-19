extends StaticBody3D

enum Status_Door { Close, Open }
var status_door : Status_Door = Status_Door.Close

var OP
var CL

func _ready():
	OP = rotation.y

func change_status_door(new_status):
	status_door = new_status

func get_status_door():
	match status_door:
		Status_Door.Close:
			CL = OP
		Status_Door.Open:
			CL = PI / 2 + OP

func get_interactive():
	if status_door == Status_Door.Close:
		change_status_door(Status_Door.Open)
	elif status_door == Status_Door.Open:
		change_status_door(Status_Door.Close)

func _physics_process(delta):
	get_status_door()
	rotation.y = move_toward(rotation.y, CL, 10 * delta)
