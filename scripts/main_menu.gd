extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	if FileAccess.file_exists("userdata.json"):
		print("istnieje user data")
	else:
		var create = "userdata.json"
		var userdata = '{ "Poziom": 0, "Rozdzielczosci": [720, 1080, 1440], "Current_level":0}'
		#var userdata_jsoned = JSON.parse_string(userdata)
		create = FileAccess.open("userdata.json", FileAccess.WRITE)
		#print(userdata_jsoned)
		create.store_string(userdata)
		create.close()
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Menu/levels.tscn")


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_credits_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
