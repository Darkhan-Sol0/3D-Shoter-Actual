extends Area3D
class_name Bulldet_Script

var coll : CollisionShape3D = CollisionShape3D.new()
var mesh : MeshInstance3D = MeshInstance3D.new()
var velocity : Vector3 = Vector3(0, 0, -1)

var bullet_resource : Bullet_Resource

var light : OmniLight3D = OmniLight3D.new()

func _ready():
	mesh.mesh = bullet_resource.bullet_mesh
	coll.shape = SphereShape3D.new()
	coll.shape.radius = mesh.mesh.radius
	light.light_color = mesh.mesh.material.albedo_color
	add_child(mesh)
	add_child(coll)
	add_child(light)
	body_entered.connect(self._on_body_entered)

func _on_body_entered(cell : Node3D):
	if cell == null:
		return
	
	if cell == self:
		return
	
	if cell.has_method("take_damage"):
		cell.take_damage(bullet_resource.bullet_damage)

func _physics_process(delta):
	var dir_move = (transform.basis * velocity).normalized()
	position += Vector3(dir_move.x, dir_move.y, dir_move.z) * bullet_resource.bullet_speed * delta
	
	await get_tree().create_timer(bullet_resource.bullet_life_time).timeout
	queue_free()
