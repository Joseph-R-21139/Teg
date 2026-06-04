extends CharacterBody2D


const SPEED =750
const JUMP_VELOCITY = -1150


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta *2.6

	# Handle jump.
	if Input.is_action_just_pressed("player_2_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("player_2_left", "player_2_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_collision_p_2_child_entered_tree(node: Node) -> void:
	pass # Replace with function body.
