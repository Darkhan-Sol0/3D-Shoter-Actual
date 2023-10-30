extends CharacterBody3D

#---Onload Nodes---
@onready var Head := $Head
@onready var coll := $CollisionShape3D
@onready var mesh := $MeshInstance3D
@onready var weapone := $Head/Weapone
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

#---Movement Setting---
@export var walk_speed : float = 7.0
@export var sprint_speed : float = 12.0
@export var seat_speed : float = 4.0
var real_speed : float
@export var jump : float = 5.0

var acceleration : float = 20
var decceleration : float = 15

enum TYPE_MOVE { WALK, SEAT, SPRINT } 
@export var type_move : TYPE_MOVE

enum TYPE_POSE { STAY, SEAT }
@export var type_pose : TYPE_POSE

var sens : float = 0.0025
var can_jump : bool = true
var input_dir : Vector2

func _ready():
	change_type_move(TYPE_MOVE.WALK)

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * sens)
		Head.rotation.x = clamp(Head.rotation.x -event.relative.y * sens, -PI/2, PI/2)
	if event is InputEventKey and event.is_action_pressed("shift"):
		change_type_move(TYPE_MOVE.SPRINT)
	if event is InputEventKey and event.is_action_pressed("ctrl"):
		change_type_move(TYPE_MOVE.SEAT)
	if event is InputEventKey and event.is_action_pressed("space") and can_jump:
		velocity.y = jump
	if event is InputEventKey and event.is_action_released("ctrl") or event.is_action_released("shift"):
		change_type_move(TYPE_MOVE.WALK)
	input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	
	if event is InputEventMouseButton and event.is_action_pressed("LBM"):
		weapone.shooted = true
	if event is InputEventMouseButton and event.is_action_released("LBM"):
		weapone.shooted = false

func get_gravity(delta):
	if is_on_floor():
		can_jump = true
		acceleration = 20
		decceleration = 15
	if not is_on_floor():
		can_jump = false
		velocity.y -= gravity * delta
		acceleration = 2
		decceleration = 2

func get_type_pose(delta):
	match type_pose:
		TYPE_POSE.STAY:
			coll.shape.height = lerp(coll.shape.height, 2.0, delta * 20)
			coll.position.y = lerp(coll.position.y, 1.0, delta * 20)
			Head.position.y = lerp(Head.position.y, 1.75, delta * 20)
			mesh.mesh.height = lerp(mesh.mesh.height, 2.0, delta * 20)
			mesh.position.y = lerp(mesh.position.y, 1.0, delta * 20)
		TYPE_POSE.SEAT:
			coll.shape.height = lerp(coll.shape.height, 1.0, delta * 20)
			coll.position.y = lerp(coll.position.y, 0.5, delta * 20)
			Head.position.y = lerp(Head.position.y, 0.75, delta * 20)
			mesh.mesh.height = lerp(mesh.mesh.height, 1.0, delta * 20)
			mesh.position.y = lerp(mesh.position.y, 0.5, delta * 20)

func change_type_pose(new_type_pose):
	type_pose = new_type_pose

func get_type_movement():
	match type_move:
		TYPE_MOVE.WALK:
			change_type_pose(TYPE_POSE.STAY)
			real_speed = walk_speed
		TYPE_MOVE.SEAT:
			change_type_pose(TYPE_POSE.SEAT)
			real_speed = seat_speed
		TYPE_MOVE.SPRINT:
			change_type_pose(TYPE_POSE.STAY)
			real_speed = sprint_speed

func change_type_move(new_type_move):
	type_move = new_type_move

func get_movement(delta):
	var dir_move = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if dir_move:
		velocity.x = lerp(velocity.x, dir_move.x * real_speed, delta * acceleration)
		velocity.z = lerp(velocity.z, dir_move.z * real_speed, delta * acceleration)
	else: 
		velocity.x = lerp(velocity.x, 0.0, delta * decceleration)
		velocity.z = lerp(velocity.z, 0.0, delta * decceleration)

func _physics_process(delta):
	get_type_movement()
	get_type_pose(delta)
	get_movement(delta)
	get_gravity(delta)
	move_and_slide()









