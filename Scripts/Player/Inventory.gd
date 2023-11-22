extends Node

@onready var player := $"../"

@export var inventory : Dictionary

@export var add : Resource 

func _ready():
	pass

func _input(event):
	pass

func add_items_inventory(item, count):
	if item.stackable and item in inventory.keys():
		inventory[item] += count
	else:
		inventory.merge({item : count})


func delet_items_inventory():
	inventory.erase(inventory.find_key(inventory.values().filter(func(num) : return num <= 0).front()))

func _process(_delta):
	if inventory.values().filter(func(num) : return num <= 0):
		delet_items_inventory()
	pass
