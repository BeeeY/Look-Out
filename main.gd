extends Node2D

signal game_over

var score = 0

const CrumbScene = preload("res://crumbs.tscn")
const FootScene = preload("res://Feet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Crumbs.set_physics_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_hud_start_game() -> void:
	score = 0
	$Player.spawn($Start.position)
	$Crumbs.set_physics_process(true)
	$CrumbTimer.start()

func _on_player_point() -> void:
	score += 1
	$Hud.update_score(score)

func _on_crumb_timer_timeout() -> void:
	var crumb = CrumbScene.instantiate()
	crumb.position = Vector2(randf_range(50,950), -40)
	add_child(crumb)
	if $CrumbTimer.wait_time > 1.50:
		$CrumbTimer.wait_time -= 0.05

func _on_foot_timer_timeout() -> void:
	var foot = CrumbScene.instantiate()
	crumb.position = Vector2(randf_range(50,950), -40)
	add_child(crumb)
	if $CrumbTimer.wait_time > 1.50:
		$CrumbTimer.wait_time -= 0.05
