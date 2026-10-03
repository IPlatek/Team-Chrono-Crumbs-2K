extends Control

@onready var you_won = $You_won
@onready var stats = $Stats

@onready var time: Label = $Time
@onready var schrooms: Label = $schrooms
@onready var jumps: Label = $Jumps

var time_value = Master_Timer.get_time()

var minutes = int(time_value) / 60
var seconds = int(time_value) % 60


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Master_Timer.stop_timer()
	var file = "userdata.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	var json_as_dict = JSON.parse_string(json_as_text)
	var current_level: int =  json_as_dict["Current_level"]
	var max_schrooms = 0
	if(current_level == 1):
		max_schrooms = 2
	elif(current_level == 2):
		max_schrooms = 23
	elif (current_level == 3):
		max_schrooms = 0
	elif(current_level == 4):
		max_schrooms == 0
	else:
		print("error")
		
	you_won.text = "You have over come the chalnegs of %s level, Congratulation!!!"
	
	time.text = "Time: " + str(minutes) + ":" +  str(seconds)
	schrooms.text = "Moschrooms you have picken up: " + str(Global.grzybki) + "/" + str(max_schrooms)
	Global.grzybki = 0
	jumps.text = "Amound of times you jumped in this level: " + str(Global.jumps)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_levels_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Menu/levels.tscn")


func _on_retry_pressed() -> void:
	var file = "userdata.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	var json_as_dict = JSON.parse_string(json_as_text)
	var current_level: int =  json_as_dict["Current_level"]
	var format_string = "res://scenes/levels/level_%s.tscn"
	var actual_string = format_string % [current_level]
	print(actual_string)
	get_tree().change_scene_to_file(actual_string)
	Master_Timer.start_timer()


func _on_next_level_pressed() -> void:
	print("nastepny level")
	var file = "userdata.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	var json_as_dict = JSON.parse_string(json_as_text)
	var current_level = json_as_dict["Current_level"]
	var level = json_as_dict["Poziom"]
	Global.current_level = current_level
	var next_level: int = current_level + 1
	var format_string = "res://scenes/levels/level_%s.tscn"
	var actual_string = format_string % [next_level]
	if(current_level>=level):
		json_as_dict.erase("Poziom")
		json_as_dict["Poziom"] = next_level
	json_as_dict.erase("Current_level")
	json_as_dict["Current_level"] = next_level
	get_tree().change_scene_to_file(actual_string)
	file = FileAccess.open("userdata.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(json_as_dict))
	file.close()
	Master_Timer.start_timer()
