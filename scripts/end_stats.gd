extends Control

@onready var you_won = $You_won
@onready var stats = $Stats

@onready var time: Label = $Time
@onready var schrooms: Label = $schrooms
@onready var jumps: Label = $Jumps



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	you_won.text = "You have over come the chalnegs of %s level, Congratulation!!!"
	
	time.text = "Time: " + str("timer")
	schrooms.text = "Moschrooms you have picken up: " + str(Global.grzybki)
	jumps.text = "Amound of times you jumped in this level: " + "counter_jumpów"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_levels_pressed() -> void:
	print("wróć")


func _on_retry_pressed() -> void:
	print("jescze raz")


func _on_next_level_pressed() -> void:
	print("nastepny level")
