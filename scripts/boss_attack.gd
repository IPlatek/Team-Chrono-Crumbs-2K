extends Area2D

@onready var attack = $attack
@onready var defuse = $defuse
@onready var boddy = $Polygon2D

var active = false

func _ready() -> void:
	position.y = randf_range(260,1000)
	boddy.color = Color(0.797, 0.0 , 0.205 ,0.5)
	attack.start()
	
func _on_defuse_timeout() -> void:
	position.y = randf_range(260,1000)
	boddy.color = Color(0.797, 0.0 , 0.205 ,0.5)
	active = false
	attack.start()
	
func _on_attack_timeout() -> void:
	boddy.color = Color(0.0, 0.0, 0.0, 1.0)
	active = true
	defuse.start()
	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("gracz") and active == true:
		Global.lifes -=1
