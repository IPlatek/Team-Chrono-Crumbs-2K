extends Node

var lifes = 1
var no_move = false
var player_force = 0
var grzybki = 0

func add_grzybek():
	grzybki += 1
	var score_label = get_tree().current_scene.get_node("Player 1/CanvasLayer/ScoreLabel")
	if score_label:
		score_label.text = "Grzybki: " + str(grzybki)
