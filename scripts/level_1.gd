extends Node2D


func _ready() -> void:
	Master_Timer.start_timer()
	await get_tree().create_timer(2.0).timeout
	var time = Master_Timer.get_time()
	print(time)
	#Global.time = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
