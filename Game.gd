extends Node2D


func _ready():
	pass

func _physics_process(_delta):
	if Input.is_action_just_pressed("quit"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene("res://menu/main_menu.tscn")
