extends CharacterBody2D


const SPEED =750
const JUMP_VELOCITY = -1150


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta *2.6

	# Handle jump.
	if Input.is_action_just_pressed("player_1_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("player_1_left", "player_1_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


	
func _ready() -> void:
			if TaggingScript.player_1_in == true:
				$indicator_sprite.visible = false
			else:
				$indicator_sprite.visible = true
