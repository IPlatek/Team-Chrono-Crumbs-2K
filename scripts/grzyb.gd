extends Area2D




func _on_body_entered(_body: Node2D) -> void:
	print("+1 grzyb")
	Global.add_grzybek()
	queue_free()
