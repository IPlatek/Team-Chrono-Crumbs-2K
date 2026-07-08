extends Area2D

@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	print("Skill issue you feell out a world boundry")
	timer.start()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	
	#trzeba dodac by player nie mógł ruszać kamerą jak wejdzie przez kill zone i ogarnąc by po przejsciu i czekaniu tej pół sekundy nie relodowało scenty tylko go tepało
	

	
