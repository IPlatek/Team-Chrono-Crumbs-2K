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
	resume()


func _on_reset_pressed() -> void:
	resume()
	get_tree().reload_current_scene()


func _on_levels_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Menu/levels.tscn")
	print("w pełni dizłam")
	



func _process(delta):
	if Input.is_action_just_pressed("escape"):
		print("menu")
	testesc()
