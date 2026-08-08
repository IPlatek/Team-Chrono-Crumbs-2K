extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")
	print("klikniete")


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")
	print("klikniete")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Menu/main_menu.tscn")
	print("klikniete")
