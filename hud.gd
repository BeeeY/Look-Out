extends Node2D

signal start_game

var Score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Score.hide()
	$GameOver.hide()
	$GameOverScore.hide()


func _on_start_pressed() -> void:
	$Title.hide()
	$Start.hide()
	$TitleBackground.hide()
	$GameOver.hide()
	$GameOverScore.hide()
	$Score.show()
	start_game.emit()


func _on_player_game_over() -> void:
	$Score.hide()
	$GameOver.show()
	$GameOverScore.text = "Crumbs : " + str(Score)
	$GameOverScore.show()
	Score = 0
	$Start.text = "Try Again?"
	$Start.show()
	
	
func update_score(score):
	$Score.text = str(score)
	Score = score
