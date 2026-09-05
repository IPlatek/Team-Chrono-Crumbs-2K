extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	var file = "userdata.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	var json_as_dict = JSON.parse_string(json_as_text)
	var level = json_as_dict["Poziom"]
	if(level < 2):
		$Button_menager/Blocked_2.visible = true
	elif(level == 2):
		$Button_menager/Blocked_2.visible = false
	else:
		$Button_menager/Blocked_2.visible = false
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")
	print("klikniete")


func _on_level_2_pressed() -> void:
	var file = "userdata.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	#otwieranmy jsnona
	var json_as_dict = JSON.parse_string(json_as_text)
	#konwertujemy go znowy na diconary idk czy może bez tego ale tak zuiała to nie ruszam
	var level = json_as_dict["Poziom"]
	#znajdujemy jaki mamy lvl
	
	print(json_as_dict)
	print(level)
	#to dla testu
	
	if(level < 2):
		print("Żeby osiągnąc 2 level najpier przejdzi pierwszy")
	else:
		get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")
		print("klikniete i osiognsiągnieto pierwszy level")
	#jak ma nie am 2 levelu tyo ine może wejść


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Menu/main_menu.tscn")
	print("klikniete")
