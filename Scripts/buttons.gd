extends Node2D
var map_selected = "forrest"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")


func _on_play__button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/get_ready_screen.tscn")


func _on_start_match_pressed() -> void:
	if map_selected == "forrest":
		get_tree().change_scene_to_file("res://Scenes/play_stage_forrest.tscn")
