extends Node

@onready var player : CharacterBody3D = $"../"
var HP : int


func _ready():
	HP = player.player_resource.HP

func take_damage(damage: int):
	HP -= damage
	if HP <= 0:
		die()

func die():
	get_parent().queue_free()
	get_tree().quit()
