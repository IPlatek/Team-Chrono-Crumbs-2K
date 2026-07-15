extends Area2D

@export var health := 1


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player_attack"):
		print("hit")
		await get_tree().create_timer(0.01).timeout
		health -= 1

	if health <= 0:
		await get_tree().create_timer(0.05).timeout
		get_parent().queue_free()
