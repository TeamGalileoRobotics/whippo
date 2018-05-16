extends KinematicBody2D

onready var splash = preload("res://splash.tscn")
var s 

const SPEED = 2
const BOOST = 500

func _ready():
	s = splash.instance()
	s.position.y -= 30
	s.position.x += 110
	s.get_child(0).connect("animation_finished", self, "deleteChild")
	add_child(s)
	s.hide()

func _process(delta):
	move_and_collide(Vector2(0, 1))
	if (Input.is_action_pressed("playerLeft_left")):
		move_local_x(-SPEED)
	if (Input.is_action_pressed("playerLeft_right")):
		move_local_x(SPEED)
	if (Input.is_action_just_pressed("playerLeft_up") && !s.get_child(0).is_playing()):
		s.show()
		s.get_child(0).play("splash")
		var dist = sqrt(pow($"/root/main/ball".global_position.x-s.global_position.x,2) + (pow($"/root/main/ball".global_position.y-s.global_position.y,2)))
		print(dist)
		if(dist < BOOST):
			$"/root/main/ball".apply_impulse(Vector2(0,0), Vector2(BOOST-dist,-BOOST+dist))


func deleteChild(done):
	s.hide()