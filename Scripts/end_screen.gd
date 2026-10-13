extends Node2D

@onready var lable = $Label

#plays a sound effect as soon as the round ends
func _ready() -> void:
	$AUDIO/end_gong.play()
	
#This code dictates what shows up at the end of the game
func _process(_delta: float) -> void:
	#This reads if player 1 is in
	if Global.player_1_in == true:
		lable.text = "Player 2 Wins!"
	#this reads if player 2 is in
	elif Global.player_1_in == false:
		lable.text = "Player 1 Wins!"

#This is a button to go to the main menu
func _on_replay_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/get_ready_scene.tscn")
