extends CharacterBody2D

#player presets
const SPEED =800
const JUMP_VELOCITY = -1250
var double_jump_charge = true

func _ready():
	add_to_group("player")
	$TAG_ANIMATION2.hide()

#controles the start of the state machine
enum States {IDLE,RUN_L,RUN_R,PAUSE}
var state = States.IDLE
func change_state(newState):
	state = newState
	
func _physics_process(delta: float) -> void:
	#starts the players animation and controles the tag indicator
	$AnimatedSprite2D_2.play("idle")
	player_2_tag_indicator()

	#state machine switchcase
	match state:
		States.IDLE:
			idle()
		States.RUN_L:
			run_l()
		States.RUN_R:
			run_r()
		States.PAUSE:
			pause()

	#genral grivity for the player
	velocity += get_gravity() * delta *3
	
	#resets the double jump when the player lands
	if is_on_floor():
		double_jump_charge = true
	
	#Controles the jump in a way that is seporate from the state machine
	if Input.is_action_just_pressed("player_2_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	#controles the double jump in a way thats like the normal jump
	if Input.is_action_just_pressed("player_2_up") and not is_on_floor():
		#if you cant double jump, nothing happens
		if double_jump_charge == true:
			velocity.y = JUMP_VELOCITY*0.9
			double_jump_charge = false
		else:
			pass

#These are all the player states
func idle():
	velocity.x = 0
	$AnimatedSprite2D_2.play("idle")
	move_and_slide()
	
	#this reads what the player is doing to see if need to change state
	if Global.player_2_paused == true:
		change_state(States.PAUSE)
	
	if Input.is_action_pressed("player_2_left"):
		change_state(States.RUN_L)
	
	if Input.is_action_pressed("player_2_right"):
		change_state(States.RUN_R)
		
func run_l():
	#checks to see if this player is in and changes the speed
	if !Global.player_1_in:
		velocity.x = -1 * SPEED * 1.2
	else:
		velocity.x = -1 * SPEED
	move_and_slide()
	$AnimatedSprite2D_2.play("run")
	
	if Input.is_action_just_released("player_2_left"):
		change_state(States.IDLE)
		
	if Global.player_2_paused == true:
		change_state(States.PAUSE)
		
func run_r():
	#checks to see if this player is in and changes the speed
	if !Global.player_1_in:
		velocity.x = 1 * SPEED * 1.2
	else:
		velocity.x = 1 * SPEED
	move_and_slide()
	$AnimatedSprite2D_2.play("run")
	
	if Input.is_action_just_released("player_2_right"):
		change_state(States.IDLE)
		
	if Global.player_2_paused == true:
		change_state(States.PAUSE)

func pause():
	#When the plyer is paused, no movenent can happen
	velocity.x = 0
	velocity.y = 0
	
	#When they stop being paused, they become idle again
	if Global.player_2_paused == false:
		change_state(States.IDLE)

#controls the tag indicator
func player_2_tag_indicator():
	if Global.player_1_in == true:
		$INDICATOR2.hide()
	else:
		$INDICATOR2.show()

	
	
	
	
	
