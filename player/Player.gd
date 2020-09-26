extends KinematicBody2D

onready var Projectile = load("res://projectile/Player_Projectile.tscn")


func _physics_process(_delta):
	# sets ships pos.x to mouse's pos.x
	var motion = (get_global_mouse_position().x - position.x) * 0.35
	translate(Vector2(motion, 0))
	
	if Input.is_action_just_pressed("fire"):
		$laser_sound.playing = false
		$laser_sound.playing = true
		var projectile = Projectile.instance()
		projectile.position = position
		get_node("/root/Game/Projectiles").add_child(projectile)
	
	#restricts ship position to keep it inside the window
	position.x = clamp(position.x, 0 + 32, 800 - 32)
