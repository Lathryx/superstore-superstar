extends Control

func _ready() -> void:
	$Area2D/AnimatedSprite2D.play("default")
	
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://store.tscn")
	pass # Replace with function body.
	
