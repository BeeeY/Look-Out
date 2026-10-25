extends CharacterBody2D

var fall_speed = 250
var warning_speed = 3


func _ready():
	add_to_group("Crumbs")


func _physics_process(delta: float) -> void:
	velocity.y = fall_speed
	move_and_slide()
