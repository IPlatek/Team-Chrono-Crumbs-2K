extends Area2D

@onready var animacja =  $"../AnimatedSprite2D"


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("gracz"):
		print("dlaczego kurwa DLACZEGO  !!!!!!")
		animacja.play("attack")
		await get_tree().create_timer( 0.4).timeout
		Global.lifes -= 1
		
