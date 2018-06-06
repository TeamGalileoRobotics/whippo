extends StaticBody2D

func _on_ball_exited(body):
	if(body == $"."):
		get_tree().paused = true