extends Node3D

@export var weapone : Weapone_Resource

var ammo : int

func _ready():
	ammo = weapone.weapone_ammo_count

func shot():
	var bullet = Bulldet_Script.new()
	bullet.bullet_resource = weapone.bullet_type
	bullet.global_transform = global_transform
	Global.add_child(bullet)

func reload():
	await get_tree().create_timer(weapone.weapone_reload_time).timeout
	ammo = weapone.weapone_ammo_count

func _process(delta):
	pass
