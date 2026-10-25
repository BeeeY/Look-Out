extends CharacterBody2D


const speed = 100


func _physics_process(delta: float) -> void:
	move_and_collide(Vector2(0, speed*delta))
