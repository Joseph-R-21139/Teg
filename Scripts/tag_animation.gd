extends Node2D

#This plays the tag animation
func _ready() -> void:
	$star_animation.play("star_flash")
