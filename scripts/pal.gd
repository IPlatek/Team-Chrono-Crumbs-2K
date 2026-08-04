extends Area2D

@export var speed_of_spining = 200
@export var direction = 1
@onready var pal = $"."

func _process(delta: float) -> void:
	rotation += deg_to_rad(speed_of_spining) * direction * delta
	
	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("gracz"):
		print("pal")
		Global.lifes -= 1
	
