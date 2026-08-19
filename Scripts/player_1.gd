extends CharacterBody2D


const SPEED =800
const JUMP_VELOCITY = -1250
var double_jump_charge = true

func _ready():
	add_to_group("player")
	$TAG_ANIMATION1.hide()


enum States {IDLE,RUN_L,RUN_R,PAUSE}
var state = States.IDLE
func change_state(newState):
	state = newState
	
func _physics_process(delta: float) -> void:
	
	$AnimatedSprite2D_1.play("idle")
	$"../player_1/AnimatedSprite2D_1".play("idle")
	player_1_tag_indicator()

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
		
	if Input.is_action_just_pressed("player_1_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	
	if Input.is_action_just_pressed("player_1_up") and not is_on_floor():
		if double_jump_charge == true:
			velocity.y = JUMP_VELOCITY*0.9
			double_jump_charge = false
		else:
			pass

func idle():
	velocity.x = 0
	move_and_slide()
	if Global.player_1_paused == true:
		change_state(States.PAUSE)
		
	if Input.is_action_pressed("player_1_left"):
		change_state(States.RUN_L)
	
	if Input.is_action_pressed("player_1_right"):
		change_state(States.RUN_R)
		
func run_l():
	if Global.player_1_in:
		velocity.x = -1 * SPEED * 1.2
	else:
		velocity.x = -1 * SPEED
	move_and_slide()
	
	if Input.is_action_just_released("player_1_left"):
		change_state(States.IDLE)
		
	if Global.player_1_paused == true:
		change_state(States.PAUSE)
func run_r():
	if Global.player_1_in:
		velocity.x = 1 * SPEED * 1.2
	else:
		velocity.x = 1 * SPEED
	move_and_slide()
	
	if Input.is_action_just_released("player_1_right"):
		change_state(States.IDLE)
	if Global.player_1_paused == true:
		change_state(States.PAUSE)

func pause():
	velocity.x = 0
	velocity.y = 0
	
	if Global.player_1_paused == false:
		change_state(States.IDLE)
	


func player_1_tag_indicator():
	if Global.player_1_in == false:
		$INDICATOR.hide()
	else:
		$INDICATOR.show()

func _on_player_1_tag_area_area_entered(_area: Area2D) -> void:
	if Global.can_tag == true:
		if Global.player_1_in == true:
			Global.player_1_in = !Global.player_1_in
			$"../tag_sound".play()
			Global.can_tag = false
			$"../can_tag_timer".start()
			$"../player_2/TAG_ANIMATION2".show()
			Global.player_2_paused = true
		else:
			Global.player_1_in = !Global.player_1_in
			$"../tag_sound".play()
			Global.can_tag = false
			$"../can_tag_timer".start()
			$TAG_ANIMATION1.show()
			Global.player_1_paused = true


func _on_can_tag_timer_timeout() -> void:
	Global.can_tag = true
	$TAG_ANIMATION1.hide()
	Global.player_1_paused = false
	$"../player_2/TAG_ANIMATION2".hide()
	Global.player_2_paused = false
	
