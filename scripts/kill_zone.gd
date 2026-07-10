extends Area2D

@onready var timer: Timer = $Timer
@onready var gracz = $"../Player 1"

func _on_body_entered(body: Node2D) -> void:
	print("You died dumbahh")
	body.get_node("CollisionShape2D").queue_free()
	timer.start()


func _on_timer_timeout() -> void:
	Global.lifes -= 1
	
		
	#trzeba dodac by player nie mógł ruszać kamerą jak wejdzie przez kill zone i ogarnąc by po przejsciu i czekaniu tej pół sekundy nie relodowało scenty tylko go tepało
	

	
