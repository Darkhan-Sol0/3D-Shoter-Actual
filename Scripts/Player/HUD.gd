extends Camera3D 

@export var player : Node3D

@onready var ammo := $CanvasLayer/Control/Ammo 

func _process(_delta):
	if player.inventory.inventory.has(player.weapone.weapone_resource.bullet_type) and player.inventory.inventory[player.weapone.weapone_resource.bullet_type] > 0:
		ammo.text = str(player.weapone.ammo, "/", player.inventory.inventory[player.weapone.weapone_resource.bullet_type])
	else:
		ammo.text = str(player.weapone.ammo, "/0")
	
