extends KinematicBody2D

const SPEED = 1

func _process(delta):
	move_and_collide(Vector2(0, 1))
	if (Input.is_action_pressed("playerRight_left")):
		move_and_collide(Vector2(-SPEED, 0))
	if (Input.is_action_pressed("playerRight_right")):
		move_and_collide(Vector2(SPEED, 0))