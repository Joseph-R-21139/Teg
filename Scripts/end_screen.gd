extends Node2D

@onready var lable = $Label

func _ready() -> void:
	$AUDIO/end_gong.play()
	

func _process(_delta: float) -> void:
	if Global.player_1_in == true:
		lable.text = "Player 2 Wins!"
	
	elif Global.player_1_in == false:
		lable.text = "Player 1 Wins!"

func _on_replay_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/get_ready_scene.tscn")
