extends RayCast3D
class_name Bulldet_Script
var velocity : Vector3 = Vector3(0, 0, -1)
var bullet_resource : Bullet_Resource
var mesh : MeshInstance3D = MeshInstance3D.new()
var light : OmniLight3D = OmniLight3D.new()
var i = 0

func _ready():
	mesh.mesh = bullet_resource.bullet_mesh
	light.light_color = bullet_resource.bullet_mesh.material.albedo_color
	add_child(mesh)
	add_child(light)
	mesh.rotation.x = (PI/2)
	target_position = Vector3(0,0,-2)

func _physics_process(delta):
	var dir_move = (transform.basis * velocity).normalized()
	position += Vector3(dir_move.x, dir_move.y, dir_move.z) * bullet_resource.bullet_speed * delta
	
	await get_tree().create_timer(bullet_resource.bullet_life_time).timeout
	queue_free()

func _process(_delta):
	if is_colliding():
		print(get_collider())
		var hole = preload("res://Scripts/Objects/HoleBlink.gd").new()
		Global.add_child(hole)
		hole.global_position = get_collision_point()
		if get_collider().has_method("get_damage"):
			get_collider().get_damage(bullet_resource.bullet_damage)
		queue_free()
