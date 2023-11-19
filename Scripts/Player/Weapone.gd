extends Node3D

@export var weapone_resource : Weapone_Resource

@onready var bulletstart := $"../Head/WeaponePos"
@onready var inventory := $"../Inventory"

var ammo : int = 30
var can_shot : bool = true

var shooting : bool = false
var reloading : bool = false

func _ready():
	ammo = weapone_resource.weapone_max_ammo

func _input(event):
	if event is InputEventMouseButton and event.is_action_pressed("LBM"):
		shooting = true
	if event is InputEventMouseButton and event.is_action_released("LBM"):
		shooting = false
	if event is InputEventKey and event.is_action_pressed("reload"):
		reload()

func shot():
	if can_shot and ammo > 0 and not reloading:
		ammo -= 1
		can_shot = false
		for i in weapone_resource.bullet_type.bullet_drob:
			get_bullet()
		await get_tree().create_timer(weapone_resource.weapone_shot_cooldown).timeout
		can_shot = true
		if weapone_resource.weapone_shot_type == "SINGLE":
			shooting = false
	elif ammo <= 0 and not reloading:
		reload()

func reload():
	for i in inventory.inventory.size():
		if inventory.inventory[i].point.name == weapone_resource.bullet_type.name and ammo < weapone_resource.weapone_max_ammo and not reloading:
			reloading = true
			await get_tree().create_timer(weapone_resource.weapone_reload_time).timeout
			var mag = weapone_resource.weapone_max_ammo - ammo
			inventory.inventory[i].count -= mag
			if inventory.inventory[i].count < 0:
				mag += inventory.inventory[i].count
			ammo += mag
			reloading = false
			break

func get_bullet():
	var bullet = Bulldet_Script.new()
	bullet.bullet_resource = weapone_resource.bullet_type
	var r = randf_range(0, weapone_resource.weapone_razbros)
	var theta = randf() * 2 * PI
	Global.add_child(bullet)
	bullet.global_transform = bulletstart.global_transform
	bullet.global_rotation += Vector3(r * sin(theta), r * cos(theta), 0)

func _physics_process(_delta):
	if shooting:
		shot()




