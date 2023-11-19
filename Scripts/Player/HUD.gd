extends Camera3D 

@export var player : Node3D

@onready var ammo := $CanvasLayer/Control/Ammo 

func _process(_delta):
	for i in player.inventory.inventory.size():
		if player.inventory.inventory[i].point.name == player.weapone.weapone_resource.bullet_type.name:
			ammo.text = str(player.weapone.ammo, "/", player.inventory.inventory[i].count)
			break
		else:
			ammo.text = str(player.weapone.ammo, "/", 0)
			break
	
	
	
