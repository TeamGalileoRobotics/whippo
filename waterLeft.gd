extends Sprite

const WATER_SPEED = 0.5

func _ready():
	pass

func _process(delta):
	if(Input.is_action_pressed("player2_up") && position.y > 500):
		position.y -= WATER_SPEED
	if(Input.is_action_pressed("player2_down") && position.y < 1024):
		position.y += WATER_SPEED