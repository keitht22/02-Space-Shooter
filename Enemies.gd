extends Node2D

onready var w  = int(get_viewport_rect().size.x)
onready var e1 = load("res://enemy/Enemy1.tscn")
onready var e2 = load("res://enemy/Enemy2.tscn")
onready var e3 = load("res://enemy/Enemy3.tscn")
onready var e4 = load("res://enemy/Enemy4.tscn")


func _ready():
	randomize()

func _on_Timer_timeout():
	var randint = randi() % 4
	if randint == 0:
		var enemy = e1.instance()
		add_child(enemy)
	if randint == 1:
		var enemy = e2.instance()
		add_child(enemy)
	if randint == 2:
		var enemy = e3.instance()
		add_child(enemy)
	if randint ==3:
		var enemy = e4.instance()
		add_child(enemy)
