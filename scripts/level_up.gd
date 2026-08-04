extends Area2D




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("gracz"):
		print("lvl_nigga")
		Global.current_level += 1
		if Global.current_level == 1:
			get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")
		elif Global.current_level == 2:
			get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")
