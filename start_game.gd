extends Node2D

onready var Ship = load("res://player/Player.tscn")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	var ship = Ship.instance()
	get_node("/root/Game/Player").add_child(ship)
