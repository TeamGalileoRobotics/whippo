extends Sprite

const WATER_SPEED = 0.5

func _ready():
	pass

func _process(delta):
	if(Input.is_action_pressed("player1_up")):
		position.y -= WATER_SPEED
	if(Input.is_action_pressed("player1_down")):
		position.y += WATER_SPEED
