extends Resource
class_name Weapone_Resource

@export var weapone_name : String ##Name weapone
@export_multiline var weapone_discriptions : String ##Weapone discriptions
@export_enum( "AUTO", "SINGLE" ) var weapone_shot_type : String ##Weapone shot type
@export var weapone_ammo_count : int ##weapone ammo count
@export var bullet_type : Bullet_Resource ## Bullet
@export var weapone_damage: int ## NEED?
@export var weapone_shot_cooldown : float ##weapone shot cooldown
@export var weapone_reload_time : float ##weapone reload time
@export var weapone_razbros : float
@export var weapone_mesh : Mesh ##weapone mesh
