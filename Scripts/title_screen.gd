extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LoadingScreen.hide() 
	$AnimatedSprite2D.play()

func _on_button_pressed():
	$LoadingScreen.show() 
	get_tree().change_scene_to_file("res://Scenes/store.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
