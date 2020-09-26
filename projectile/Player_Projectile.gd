extends KinematicBody2D

export var velocity = Vector2(0, -12)
onready var HUD = get_node("/root/Game/HUD")

func _ready():
	pass


func _physics_process(_delta):
	position += velocity
	if position.y == -1:
		queue_free()

func _on_hitbox_body_entered(body):
	body.queue_free()
	HUD.update_score(1)
