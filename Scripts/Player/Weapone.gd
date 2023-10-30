extends Node3D

@export var weapone : Weapone_Resource

var mesh : MeshInstance3D = MeshInstance3D.new()

var ammo : int

var can_shot : bool = true
var shooted : bool = false

func _ready():
	mesh.mesh = weapone.weapone_mesh
	add_child(mesh)
	ammo = weapone.weapone_ammo_count

func attack():
	if can_shot:
		for i in weapone.weapone_drop_bullet:
			shot()
		can_shot = false
		await get_tree().create_timer(weapone.weapone_shot_cooldown).timeout
		can_shot = true

func shot():
	var bullet = Bulldet_Script.new()
	bullet.bullet_resource = weapone.bullet_type
	bullet.global_transform = global_transform
	bullet.rotation.z = randf_range(0, 2 * PI)
	bullet.velocity.y += randf_range(0, weapone.weapone_razbros)
	Global.add_child(bullet)

func reload():
	await get_tree().create_timer(weapone.weapone_reload_time).timeout
	ammo = weapone.weapone_ammo_count

func _physics_process(_delta):
	if shooted:
		attack()
