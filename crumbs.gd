extends CharacterBody2D

var fall_speed = 250
var warning_speed = 3

var textures = [
	preload("res://assets/Half Eaten Fruits1.png"),
	preload("res://assets/Half Eaten Fruits2.png"),
	preload("res://assets/Half Eaten Fruits3.png"),
]

func _ready():
	add_to_group("Crumbs")
	$Sprite2D.texture = textures.pick_random()


func _physics_process(delta: float) -> void:
	velocity.y = fall_speed
	move_and_slide()
