extends Control

@onready var resolution_option_button = $Panel/HBoxContainer/VBoxContainer/OptionButton

func _ready():
	get_window().unresizable = false
	
	print("1: ", get_window().unresizable)
	
	await get_tree().create_timer(1.0).timeout
	
	print("2: ", get_window().unresizable)
	
	add_resolutions()
	
	#get_window().size = Vector2i(1920, 1080)
	

var resolutions = {
	"3840x2160": Vector2i(3840, 2160),
	"2575x1440": Vector2i(2575, 1440),
	"1920x1080": Vector2i(1920, 1080),
	"1366x768": Vector2i(1366, 768),
	"1280x720": Vector2i(1280, 720),
	"1440x900": Vector2i(1440, 900),
	"1600x900": Vector2i(1600, 900),
	"1024x600": Vector2i(1024, 600),
	"800x600": Vector2i(800, 600)
}

func add_resolutions():
	for r in resolutions:
		resolution_option_button.add_item(r)

func update_button_values():
	var windows_size_string = str(get_window().size.x, "x", get_window().size.y)
	var resolutions_index = resolutions.keys().find(windows_size_string)
	resolution_option_button.selected = resolutions_index
	
	
func _on_option_button_item_selected(index):
	var tryb_ekranu = get_window().mode
	if(tryb_ekranu == 0):
		var key = resolution_option_button.get_item_text(index)
		var new_size = resolutions[key]

		if get_window().mode == Window.MODE_EXCLUSIVE_FULLSCREEN:
			get_window().mode = Window.MODE_WINDOWED
			await get_tree().process_frame

		get_window().size = new_size

		center_window()
		var file = "userdata.json"
		var file_as_text = FileAccess.get_file_as_string(file)
		var file_as_dict = JSON.parse_string(file_as_text)
		file_as_dict.erase("Rozdzielczosci")
		file_as_dict["Rozdzielczosci"] = [new_size.x, new_size.y]
		print(new_size)
		file = FileAccess.open("userdata.json", FileAccess.WRITE)
		file.store_string(JSON.stringify(file_as_dict))
		file.close()
	else:
		print("nie działa w trybie pełno ekranowym")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Menu/main_menu.tscn")
	
	
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
	
func set_fullscreen():
	get_window().mode = Window.MODE_FULLSCREEN
	
func set_windowed():
	get_window().mode = Window.MODE_WINDOWED
