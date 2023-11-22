extends Resource
class_name Weapone_Resource

@export var name : String ##Name weapone
@export_multiline var discriptions : String ##Weapone discriptions

@export_group("Battle Setting")
@export_enum( "SINGLE", "AUTO") var weapone_shot_type : String = "SINGLE" ##Weapone shot type
@export var weapone_max_ammo : int ##weapone ammo count
@export var bullet_type : Bullet_Resource ## Bullet
@export var weapone_damage: int = 0 ## NEED?
@export var weapone_shot_cooldown : float = 1 ##weapone shot cooldown
@export var weapone_reload_time : float = 1 ##weapone reload time
@export var weapone_razbros : float = 0.05
@export var weapone_mesh : Mesh ##weapone mesh

@export_group("Loot Setting")
@export var stackable : bool = false
@export var loot_mesh : Mesh
@export var loot_type : String = "Weapone"

