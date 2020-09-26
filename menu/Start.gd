extends Control

onready var global = get_node("/root/Global")

func _on_Start_pressed():
	global.health = 100
	global.score = 30
	get_tree().change_scene("res://Game.tscn")

func _on_Quit_pressed():
	get_tree().quit()

func _physics_process(_delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
