extends Resource
class_name Bullet_Resource

@export var name : String
@export_multiline var discriptions : String

@export_group("Battle Setting")
@export var bullet_damage : int
@export var bullet_drob : int = 1
@export var bullet_speed : float = 50
@export var bullet_life_time : float = 2
@export var bullet_mesh : Mesh

@export_group("Loot Setting")
@export var stackable : bool = true
@export var loot_mesh : Mesh
