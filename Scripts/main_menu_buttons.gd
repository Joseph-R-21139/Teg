extends Node2D


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")


func _on_play__button_pressed() -> void:
	get_tree().change_scene_to_file("res://match_settings.tscn")
