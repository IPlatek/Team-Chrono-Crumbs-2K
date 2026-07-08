extends Area2D

@onready var timer: Timer = $Timer
@onready var gracz = $"../Player 1"

func _on_body_entered(body: Node2D) -> void:
	print("Skill issue you feell out a world boundry")
	timer.start()


func _on_timer_timeout() -> void:
	Global.lifes = 0
	
		
	#trzeba dodac by player nie mógł ruszać kamerą jak wejdzie przez kill zone i ogarnąc by po przejsciu i czekaniu tej pół sekundy nie relodowało scenty tylko go tepało
	

	
