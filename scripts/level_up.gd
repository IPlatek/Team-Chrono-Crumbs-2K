extends Area2D




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("gracz"):
		#print("lvl_nigga") to chyba nie był wiatr
		#Global.current_level += 1
		#if Global.current_level == 1:
			#get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")
		#elif Global.current_level == 2:
		
			

		var file = "userdata.json"
		var json_as_text = FileAccess.get_file_as_string(file)
		var json_as_dict = JSON.parse_string(json_as_text)
		var current_level = json_as_dict["Current_level"]
		#print(current_level)
		var next_level: int = current_level + 1
		#print(next_level)
		var format_string = "res://scenes/levels/level_%s.tscn"
		var actual_string = format_string % [next_level]
		#print(actual_string)
		json_as_dict.erase("Poziom")
		json_as_dict.erase("Current_level")
		json_as_dict["Poziom"] = next_level
		json_as_dict["Current_level"] = next_level
		get_tree().change_scene_to_file(actual_string)
		file = FileAccess.open("userdata.json", FileAccess.WRITE)
		file.store_string(JSON.stringify(json_as_dict))
		#tu ta pierwsz czesci zapisuje plik a ta druga zamienia na tekst chyba  a nie na jsona
		file.close()
	
