extends Sprite

const WATER_SPEED = 0.5
const MIN_WATER_Y = 500
const MAX_WATER_Y = 270

func _process(delta):
	if(Input.is_action_pressed("player2_up") && position.y > MAX_WATER_Y):
		position.y -= WATER_SPEED
	if(Input.is_action_pressed("player2_down") && position.y < MIN_WATER_Y):
		position.y += WATER_SPEED