extends Node2D

var speed = 200
var warning_speed = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("Feet")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func stomp():
	$AnimatedSprite2D.animation = "Stomp Warning"
	await get_tree().create_timer(1.0).timeout
	$AnimatedSprite2D.animation = "Foot"
	
	var tween =  create_tween()
	tween.tween_property(self, "position:y", position.y + 1800, 0.5)
	tween.tween_interval(0.4)
	tween.tween_property(self, "position:y", position.y - 1800, 3)
	tween.tween_callback(queue_free)


func slide(direction):
	
	if direction == 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.animation = "Slide Warning"
		await get_tree().create_timer(1.0).timeout
		$AnimatedSprite2D.animation = "Foot"
		
		var tween =  create_tween()
		tween.tween_property(self, "position:y", position.y + 1800, 0.5)
		tween.tween_interval(0.5)
		tween.tween_property(self, "position:x", position.x + 850, 0.8)
		tween.tween_interval(0.4)
		tween.tween_property(self, "position:y", position.y - 1800, 3)
		tween.tween_callback(queue_free)
		
	else:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.animation = "Slide Warning"
		await get_tree().create_timer(1.0).timeout
		$AnimatedSprite2D.animation = "Foot"
		
		var tween =  create_tween()
		tween.tween_property(self, "position:y", position.y + 1800, 0.5)
		tween.tween_interval(0.5)
		tween.tween_property(self, "position:x", position.x - 850, 0.8)
		tween.tween_interval(0.4)
		tween.tween_property(self, "position:y", position.y - 1800, 3)
		tween.tween_callback(queue_free)
