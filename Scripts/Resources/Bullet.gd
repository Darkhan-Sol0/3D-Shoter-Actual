extends Resource
class_name Bullet_Resource

@export var bullet_name : String
@export_enum( "NONE", "FIRE", "ICE", "BLOOD" ) var bullet_debuff_type : String
@export var bullet_damage : int
@export var bullet_debuff_damage : int
@export var bullet_debuff_time : float
@export var bullet_speed : float
@export var bullet_life_time : float
@export var bullet_mesh : Mesh
