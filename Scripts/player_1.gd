extends CharacterBody2D


const SPEED =750
const JUMP_VELOCITY = -1150
var double_jump_charge = true

func _ready():
	add_to_group("player")
	
func _physics_process(delta: float) -> void:
	
	$AnimatedSprite2D_1.play("idle")
	$"../player_2/AnimatedSprite2D_2".play("idle")
	player_1_tag_indicator()
	
	if is_on_floor():
		double_jump_charge = true
	
	if not is_on_floor():
		velocity += get_gravity() * delta *2.6
		
	# Handle jump.
	if Input.is_action_just_pressed("player_1_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	#Handles dropping mid air
	if Input.is_action_just_pressed("player_1_up") and not is_on_floor():
		if double_jump_charge == true:
			velocity.y = -1000
			double_jump_charge = false
		else:
			pass

	# Get the input direction and handle the movement/decelerawtion.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("player_1_left", "player_1_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func player_1_tag_indicator():
	if Global.player_1_in == false:
		$INDICATOR.hide()
	else:
		$INDICATOR.show()

func double_jump():
	if is_on_floor():
		double_jump_charge = true



@warning_ignore("unused_parameter")
func _on_player_1_tag_area_area_entered(area: Area2D) -> void:
	
	Global.player_1_in = !Global.player_1_in
