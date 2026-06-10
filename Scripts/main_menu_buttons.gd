extends Node2D
var map_selected = "forrest"


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")


func _on_play__button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/get_ready_screen.tscn")


func _on_start_match_pressed() -> void:
	if map_selected == "forrest":
		get_tree().change_scene_to_file("res://Scenes/play_stage_forrest.tscn")


func _on_back_to_main_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
