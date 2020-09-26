#Enemy 1
extends KinematicBody2D

export var move_probability = 0.5
export var shoot_probability = 0.2
export var speed = 2.0
onready var w = int(get_viewport_rect().size.x)
onready var h = int(get_viewport_rect().size.y - 250)

onready var Projectile = load("res://projectile/Projectile.tscn")

func _ready():
	set_process(true)
	randomize()

func _process(_delta):
	position.x = clamp(position.x, 0 + 32, 800 - 32)


func move():
	var new_position = Vector2(randi() % w, randi() % h)
	$Tween.interpolate_property(self, "position", position, new_position, speed, Tween.TRANS_EXPO, Tween.EASE_IN_OUT)
	$Tween.start()

func shoot():
	var proj = Projectile.instance()
	proj.position = position + Vector2(0, 10)
	get_node("/root/Game/Projectiles").add_child(proj)

func _on_Move_timeout():
	if randf() < move_probability:
		move()


func _on_Shoot_timeout():
	if randf() < shoot_probability:
		shoot()
