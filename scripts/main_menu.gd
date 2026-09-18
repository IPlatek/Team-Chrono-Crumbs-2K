extends Node2D

func center_window():
	var screen_pos = DisplayServer.screen_get_position()
	print(screen_pos)
	var screen_size = DisplayServer.screen_get_size()
	print(screen_size)
	var screen_center = (screen_pos + screen_size / 2)
	print(screen_center)
	var window_size = get_window().get_size_with_decorations()
	print(window_size)
	get_window().set_position(screen_center - window_size / 2)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	if FileAccess.file_exists("userdata.json"):
		print("istnieje user data")
	else:
		var create = "userdata.json"
		var userdata = '{ "Poziom": 0, "Rozdzielczosci": [720, 1440], "Current_level":0}'
		#var userdata_jsoned = JSON.parse_string(userdata)
		create = FileAccess.open("userdata.json", FileAccess.WRITE)
		#print(userdata_jsoned)
		create.store_string(userdata)
		create.close()
		

	var tryb_ekranu = get_window().mode
	if(tryb_ekranu == 0):
		var file = "userdata.json"
		var file_as_text = FileAccess.get_file_as_string(file)
		var file_as_dict = JSON.parse_string(file_as_text)
		var size = (file_as_dict["Rozdzielczosci"])
		
		get_window().size = Vector2i(size[0], size[1])
		center_window()
	else:
		print("nie działa w trybie pełno ekranowym")

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Menu/levels.tscn")


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/resolution.tscn")


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Menu/credits.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
