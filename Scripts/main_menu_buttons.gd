extends Node2D

#Button to quit the game
func _on_exit_button_pressed() -> void:
	get_tree().quit()

#Button to options menu
func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")


#Button to get ready page
func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/get_ready_scene.tscn")
