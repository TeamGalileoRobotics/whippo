extends KinematicBody2D

onready var splash = preload("res://splash.tscn")
var s 

const SPEED = 2

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
		$"/root/main/ball".apply_impulse(Vector2(s.position.x,s.position.y), Vector2(-100,-100))

func deleteChild(done):
	s.hide()