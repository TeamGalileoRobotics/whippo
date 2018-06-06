extends KinematicBody2D

onready var splash = preload("res://splash.tscn")
var s 

const SPEED = 2
const BOOST = 10000
const MAX_BOOST_DIST = 500

func _ready():
	s = splash.instance()
	s.flip_h = true
	s.position.y -= 35
	s.position.x -= 90
	s.get_child(0).connect("animation_finished", self, "deleteChild")
	add_child(s)
	s.hide()

func _process(delta):
	move_and_collide(Vector2(0, 1))
	if (Input.is_action_pressed("playerRight_left")):
		move_local_x(-SPEED)
	if (Input.is_action_pressed("playerRight_right")):
		move_local_x(SPEED)
	if (Input.is_action_just_pressed("playerRight_up")  && !s.get_child(0).is_playing()):
		s.show()
		s.get_child(0).play("splash")
		var ball = $"/root/main/ball"
		var dist = sqrt(pow(ball.global_position.x - s.global_position.x, 2) + pow(ball.global_position.y - s.global_position.y, 2))
		dist += 0.1
		var power = BOOST / dist
		if (dist < MAX_BOOST_DIST):
			ball.apply_impulse(Vector2(0, 0), Vector2(- power, - power))

func deleteChild(done):
	s.hide()