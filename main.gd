extends Node2D

signal game_over

var score = 0
var slide


const CrumbScene = preload("res://crumbs.tscn")
const FootScene = preload("res://feet.tscn")


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
	$FootTimer.start()
	

func _on_player_game_over() -> void:
	$CrumbTimer.stop()
	$FootTimer.stop()
	get_tree().call_group("Feet", "queue_free")
	get_tree().call_group("Crumbs", "queue_free")


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
	var stompslide = randi_range(0,1)
	var foot = FootScene.instantiate()
	
	if stompslide == 0:
		foot.position = Vector2(randf_range(100,900), -950)
	else:
		slide = randi_range(0,1)
		if slide == 0:
			foot.position = Vector2(100, -950)
		else:
			foot.position = Vector2(900, -950)

	add_child(foot)
	
	if stompslide == 0:
		foot.stomp()
	else:
		if slide == 0:
			foot.slide(0)
		else:
			foot.slide(1)
	
	if $FootTimer.wait_time > 1.50:
		$FootTimer.wait_time -= 0.05
