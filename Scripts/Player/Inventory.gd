extends Node

@onready var player := $"../"

@export var inventory : Array[inventory_point]

func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton and event.is_action_pressed("RBM"):
		for i in inventory.size():
			print(inventory[i].point.name)

func add_items_inventory(item, count):
	if item.stackable:
		for i in inventory.size():
			if item.name == inventory[i].point.name:
				inventory[i].count += count
				return
	var c = inventory_point.new()
	c.point = item
	c.count = count
	inventory.append(c)

func delet_items_inventory():
	for i in inventory.size():
		if inventory[i].count <= 0:
			inventory.remove_at(i)
			break

func _process(_delta):
	delet_items_inventory()
	pass
