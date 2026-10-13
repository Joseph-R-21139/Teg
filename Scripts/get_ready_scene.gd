extends Node2D

#This starts the eggs animation
func  _ready() -> void:
	$"VISUAL ASSETS/egg".play("idle")

#Main menu button
func _on_back_to_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_start_game_button_pressed() -> void:
	#This reads for what play map is selected
	if Global.game_stage == "forrest":
		get_tree().change_scene_to_file("res://play_stage_forrest.tscn")
	
	else:
		get_tree().change_scene_to_file("res://Scenes/play_stage_red.tscn")
