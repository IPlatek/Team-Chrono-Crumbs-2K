extends Node

var start_time: float = 0.0
var stopped: bool = false
var final_time: float = 0.0


func start_timer():
	start_time = Time.get_ticks_msec() / 1000.0
	stopped = false


func stop_timer():
	if not stopped:
		final_time = Time.get_ticks_msec() / 1000.0 - start_time
		stopped = true


func get_time() -> float:
	if stopped:
		return final_time
	
	return Time.get_ticks_msec() / 1000.0 - start_time
