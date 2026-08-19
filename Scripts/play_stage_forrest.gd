extends Node2D

@onready var timer: Timer = $end_timer
@onready var label: Label = $Label

func _physics_process(_delta: float) -> void:
	if timer.is_stopped():
		label.text = "1.30"
		return
		
	
	var time_left: float = timer.time_left
	
	
	@warning_ignore("integer_division")
	var minutes: int = int(time_left) / 60
	var seconds: int = int(time_left) % 60
	
	label.text = "%d:%02d" % [minutes, seconds]


func _ready():
	$TIMERS/start_timer.start()
	$VISUAL_ASSETS/AnimationPlayer.play("start_animation")
	Global.player_1_paused = true
	Global.player_2_paused = true
	$TIMERS/wait_a_sec.start()
	$TIMERS/music_start_timer.start()

func _on_end_timer_timeout() -> void:
	$MUSIC/music_player.stop()
	get_tree().change_scene_to_file("res://Scenes/end_screen.tscn")

func _on_start_timer_timeout() -> void:
	$VISUAL_ASSETS/countdown_animation.hide()
	Global.player_1_paused = false
	Global.player_2_paused = false
	$end_timer.start()

	

func _on_wait_a_sec_timeout() -> void:
	$VISUAL_ASSETS/AnimationPlayer/AudioStreamPlayer2D.play()


func _on_music_start_timer_timeout() -> void:
	$MUSIC/music_player.play()
	$TIMERS/music_replay_timer.start()


func _on_music_replay_timer_timeout() -> void:
	$MUSIC/music_player.play()
	$TIMERS/music_replay2_timer.start()

func _on_music_replay_2_timer_timeout() -> void:
	$MUSIC/music_player.play()
	pass
