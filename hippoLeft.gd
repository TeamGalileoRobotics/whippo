extends KinematicBody2D

const SPEED = 1

func _ready():
	pass

func _process(delta):
	if (Input.is_action_pressed("playerLeft_left")):
		move_and_collide(Vector2(-SPEED, 0))
	if (Input.is_action_pressed("playerLeft_right")):
		move_and_collide(Vector2(SPEED, 0))