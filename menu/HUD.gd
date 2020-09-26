extends Control

onready var global = get_node("/root/Global")

func _ready():
	update_score(0)
	update_health(0)
	
func update_score(s):
	global.score -= s
	$score.text = "Score: " + str(global.score)
	if global.score < 0:
# warning-ignore:return_value_discarded
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene("res://Victory.tscn")
		

func update_health(h):
	global.health -= h
	$health.text = "Health: " + str(global.health)
	if global.health <= 0:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://menu/main_menu.tscn")
