extends Node2D
var map_selected = "forrest"


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")



func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/get_ready_scene.tscn")
