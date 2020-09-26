#Enemy 3
extends KinematicBody2D

export var move_probability = 0.75
export var attack_probability = 0.8
export var speed = 1.0
onready var w = int(get_viewport_rect().size.x)
onready var h = int(get_viewport_rect().size.y - 250)

onready var Projectile = load("res://projectile/Projectile.tscn")

func _ready():
	randomize()

func _process(_delta):
	position.x = clamp(position.x, 0 + 32, 800 - 32)
	if self.position.y > (h + 350):
		attack_probability = 0.0

func move():
	var new_position = Vector2(randi() % w, randi() % h)
	$Tween.interpolate_property(self, "position", position, new_position, speed, Tween.TRANS_EXPO, Tween.EASE_IN_OUT)
	$Tween.start()


func attack():
	var proj = Projectile.instance()
	proj.position = position + Vector2(0, 10)
	get_node("/root/Game/Projectiles").add_child(proj)

func _on_Move_timeout():
	if randf() < move_probability:
		move()


func _on_Attack_timeout():
	if randf() < attack_probability:
		attack()


func _on_Shoot_timeout():
	pass # Replace with function body.
