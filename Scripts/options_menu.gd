extends Node2D



func _on_back_to_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	

func _physics_process(_delta: float) -> void:
	if Global.game_stage == "forrest":
		$VISUALS/red_selected.hide()
	elif Global.game_stage == "red":
		$VISUALS/forrest_selected.hide()


func _on_forrest_map_select_pressed() -> void:
	Global.game_stage = "forrest"
	$VISUALS/red_selected.hide()
	$VISUALS/forrest_selected.show()

func _on_red_map_selected_pressed() -> void:
	Global.game_stage = "red"
	$VISUALS/forrest_selected.hide()
	$VISUALS/red_selected.show()
