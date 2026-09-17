extends Node2D

@onready var timer = $Timer

func _ready() -> void:
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/Menu/main_menu.tscn")
