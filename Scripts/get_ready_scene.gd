extends Node2D
func  _ready() -> void:
	$"VISUAL ASSETS/egg".play("idle")

func _on_back_to_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_start_game_button_pressed() -> void:
	if Global.game_stage == "forrest":
		get_tree().change_scene_to_file("res://play_stage_forrest.tscn")
	
	else:
		get_tree().change_scene_to_file("res://Scenes/play_stage_red.tscn")
