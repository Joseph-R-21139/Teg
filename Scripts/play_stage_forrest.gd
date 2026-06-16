extends Node2D

@onready var lable = $Label
@onready var timer = $end_timer

func _ready():
	timer.start()

func time_left():
	@warning_ignore("shadowed_variable")
	var time_left = timer.time_left
	var minute = floor(time_left/60)
	var second = int(time_left) % 60
	return [minute, second]

@warning_ignore("unused_parameter")
func _process(delta):
	lable.text = "%02d:%02d" % time_left()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/end_screen.tscn")
