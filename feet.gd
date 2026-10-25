extends Node2D

var speed = 200
var warning_speed = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("Feet")
	stomp()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func stomp():
	var tween =  create_tween()
	tween.tween_property(self, "position:y", position.y + 1000, 0.5)
	tween.tween_interval(0.4)
	tween.tween_property(self, "position:y", position.y - 1000, 3)
	tween.tween_callback(queue_free)
	
func slide():
	var tween =  create_tween()
	tween.tween_property(self, "position:y", position.y + 1000, 0.5)
	tween.tween_interval(0.4)
	tween.tween_property(self, "position:x", position.x + 700, 0.5)
	tween.tween_interval(0.4)
	tween.tween_property(self, "position:y", position.y - 1000, 3)
	tween.tween_callback(queue_free)
