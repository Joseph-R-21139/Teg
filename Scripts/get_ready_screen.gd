extends Node2D
var map_selected = "forrest"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$VISUALS/AnimatedSprite2D.play("display_idle")

func _on_start_match_pressed() -> void:
	if map_selected == "forrest":
		get_tree().change_scene_to_file("res://Scenes/play_stage_forrest.tscn")


func _on_back_to_main_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
