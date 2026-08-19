extends CharacterBody2D

const SPEED =800
const JUMP_VELOCITY = -1250
var double_jump_charge = true

func _ready():
	add_to_group("player")
	$TAG_ANIMATION2.hide()
	
enum States {IDLE,RUN_L,RUN_R,PAUSE}
var state = States.IDLE
func change_state(newState):
	state = newState
	
func _physics_process(delta: float) -> void:
	
	$AnimatedSprite2D_2.play("idle")
	player_2_tag_indicator()

	match state:
		States.IDLE:
			idle()
		States.RUN_L:
			run_l()
		States.RUN_R:
			run_r()
		States.PAUSE:
			pause()


	velocity += get_gravity() * delta *3
	
	if is_on_floor():
		double_jump_charge = true
		
	if Input.is_action_just_pressed("player_2_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	
	if Input.is_action_just_pressed("player_2_up") and not is_on_floor():
		if double_jump_charge == true:
			velocity.y = JUMP_VELOCITY*0.9
			double_jump_charge = false
		else:
			pass

func idle():
	velocity.x = 0
	$AnimatedSprite2D_2.play("idle")
	move_and_slide()
	
	if Global.player_2_paused == true:
		change_state(States.PAUSE)
	
	if Input.is_action_pressed("player_2_left"):
		change_state(States.RUN_L)
	
	if Input.is_action_pressed("player_2_right"):
		change_state(States.RUN_R)
		
func run_l():
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
	velocity.x = 0
	velocity.y = 0
	
	if Global.player_2_paused == false:
		change_state(States.IDLE)

func player_2_tag_indicator():
	if Global.player_1_in == true:
		$INDICATOR2.hide()
	else:
		$INDICATOR2.show()

	
	
	
	
	
