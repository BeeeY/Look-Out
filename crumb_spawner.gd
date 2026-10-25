extends Node2D
var spawner_position = null
var crumb = preload("res://crumbs.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	spawner_position = $Spawner.get_children()

func spawn_crumb():
	var index = randi_range(10,990)
	var Crumb = crumb.instance()
	Crumb.global_position = spawner_position[index].global_position
	add_child(Crumb)

func _on_timer_timeout() -> void:
	spawn_crumb()
	Timer.wait_time -= 0.1
