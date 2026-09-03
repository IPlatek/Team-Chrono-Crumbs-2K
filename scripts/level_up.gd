extends Area2D




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("gracz"):
		print("lvl_nigga")
		Global.current_level += 1
		if Global.current_level == 1:
			get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")
		elif Global.current_level == 2:
			get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")
			

		var file = "userdata.json"
		var json_as_text = FileAccess.get_file_as_string(file)
		#otwieranmy jsnona
		var json_as_dict = JSON.parse_string(json_as_text)
		#var file = "userdata.json"
		#var json_as_text = FileAccess.get_file_as_string(file)
		#można rtez tak on owtwiera bierze dane jako tekst i automatycznie zmykla
		
		json_as_dict["level"] = Global.current_level

		file = FileAccess.open("res://data.json", FileAccess.WRITE)
		
		file.store_string(JSON.stringify(json_as_dict))
		#tu ta p[ierwsz czesci zapisuje plik a ta druga zamienia na jsonadddddd
		file.close()
	
