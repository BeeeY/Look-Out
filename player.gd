extends CharacterBody2D

signal point
signal game_over

const SPEED = 400
const JUMP_VELOCITY = -600.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction > 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
		
	if velocity.x != 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position.x = clamp(position.x, 70, 930)

	move_and_slide()


func spawn(pos):
	position = pos


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Crumbs"):
		point.emit()
		body.queue_free()
		
	if body.is_in_group("Feet"):
		game_over.emit()
		print("aildklfjsdl")
