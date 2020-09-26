extends KinematicBody2D

export var velocity = Vector2(0, -12)
onready var HUD = get_node("/root/Game/HUD")

func _ready():
	pass


func _physics_process(_delta):
	position += velocity
	if self.position.y > get_viewport_rect().size.y:
		queue_free()


func _on_Area2D_body_entered(body):
	body.queue_free()


func _on_hitbox_body_entered(body):
	HUD.update_health(30)
