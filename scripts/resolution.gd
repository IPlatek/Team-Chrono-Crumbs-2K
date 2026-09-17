extends Control

@onready var resolution_option_button = $Panel/HBoxContainer/VBoxContainer/OptionButton

func _ready():
	get_window().unresizable = false
	
	print("1: ", get_window().unresizable)
	
	await get_tree().create_timer(1.0).timeout
	
	print("2: ", get_window().unresizable)
	
	add_resolutions()
	
	get_window().size = Vector2i(1366, 768)

var resolutions = {
	"3840x2160": Vector2i(3840, 2160),
	"2560x1440": Vector2i(2560, 1440),
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
	var key = resolution_option_button.get_item_text(index)
	var new_size = resolutions[key]

	if get_window().mode == Window.MODE_EXCLUSIVE_FULLSCREEN:
		get_window().mode = Window.MODE_WINDOWED
		await get_tree().process_frame

	get_window().size = new_size


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Menu/main_menu.tscn")
