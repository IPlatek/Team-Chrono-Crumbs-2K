extends Area2D

func _on_body_entered(body):
	if body is CharacterBody2D:
		body.speed_multiplier = 0.3
		body.gravity_multiplier = 0.002
		body.velocity.y = min(body.velocity.y, 200)
		body.velocity.x = min(body.velocity.x, 300)
		body.DASH_SPEED = 750.67
		print("enter")
		

func _on_body_exited(body):
	if body is CharacterBody2D:
		body.speed_multiplier = 1.0
		body.gravity_multiplier = 1.0
		print("exit")
