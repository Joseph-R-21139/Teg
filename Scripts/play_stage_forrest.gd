extends Node2D

#Presets for the match timer
@onready var timer: Timer = $end_timer
@onready var label: Label = $Label


func _physics_process(_delta: float) -> void:
	#timer sets
	if timer.is_stopped():
		label.text = "1.30"
		return
		
	
	var time_left: float = timer.time_left
	
	#calculator to show the time properly
	@warning_ignore("integer_division")
	var minutes: int = int(time_left) / 60
	var seconds: int = int(time_left) % 60
	
	label.text = "%d:%02d" % [minutes, seconds]


func _ready():
	#This sections is starting all of the things like animation and the clock
	$TIMERS/start_timer.start()
	$VISUAL_ASSETS/AnimationPlayer.play("start_animation")
	
	#This makes sure the players are paused before the game starts
	Global.player_1_paused = true
	Global.player_2_paused = true
	
	#This starts all the hidden timers for things like the music loops
	$TIMERS/wait_a_sec.start()
	$TIMERS/music_start_timer.start()

#This triggers when the match ends
func _on_end_timer_timeout() -> void:
	#this stopps the music and changes to the end game scene
	$MUSIC/music_player.stop()
	get_tree().change_scene_to_file("res://Scenes/end_screen.tscn")

#This is the start of the game after the countdown
func _on_start_timer_timeout() -> void:
	#Coundown hiding
	$VISUAL_ASSETS/countdown_animation.hide()
	#This gives the players music
	Global.player_1_paused = false
	Global.player_2_paused = false
	$end_timer.start()

	
#timer so the music doesnt emediotly start
func _on_wait_a_sec_timeout() -> void:
	$VISUAL_ASSETS/AnimationPlayer/AudioStreamPlayer2D.play()

#music start timer 
func _on_music_start_timer_timeout() -> void:
	$MUSIC/music_player.play()
	$TIMERS/music_replay_timer.start()

#music loop
func _on_music_replay_timer_timeout() -> void:
	$MUSIC/music_player.play()
	$TIMERS/music_replay2_timer.start()

#music look squard
func _on_music_replay_2_timer_timeout() -> void:
	$MUSIC/music_player.play()
	pass
