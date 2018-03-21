extends KinematicBody2D

const SPEED = 2

func _process(delta):
	move_and_collide(Vector2(0, 1))
	if (Input.is_action_pressed("playerRight_left")):
		move_local_x(-SPEED)
	if (Input.is_action_pressed("playerRight_right")):
		move_local_x(SPEED)