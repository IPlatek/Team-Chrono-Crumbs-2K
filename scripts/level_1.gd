extends Node2D


func _ready() -> void:
	$Timer.start()
	Global.time = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
