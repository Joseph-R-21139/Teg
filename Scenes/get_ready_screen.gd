extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$VISUALS/AnimatedSprite2D.play("display_idle")
