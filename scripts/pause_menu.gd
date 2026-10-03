extends Control


func _ready():
	hide()
	#$AnimationPlayer.play("RESET")
	

	
	
func resume():
	hide()
	get_tree().paused = false
	#$AnimationPlayer.play_backwards("blur")
	

func pause():
	print("pause")
	show()
	#$AnimationPlayer.play("blur")
	get_tree().paused = true
	
	
func testesc():
	if Input.is_action_just_pressed("escape") and get_tree().paused == false:
		pause()
	elif get_tree().paused == true and Input.is_action_just_pressed("escape"):
		resume()
		
	


func _on_resume_pressed() -> void:
	Master_Timer.stop_timer()
	var czas_przed_zatrzymaniem = Master_Timer.get_time()
	print(czas_przed_zatrzymaniem)
	Master_Timer.star_timer_after_awaiting(czas_przed_zatrzymaniem)
	resume()


func _on_reset_pressed() -> void:
	resume()
	get_tree().reload_current_scene()
	Master_Timer.stop_timer()
	Master_Timer.start_timer()


func _on_levels_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Menu/levels.tscn")
	Master_Timer.stop_timer()
	print("w pełni dizłam")
	



func _process(delta):
	if Input.is_action_just_pressed("escape"):
		print("menu")
	testesc()
