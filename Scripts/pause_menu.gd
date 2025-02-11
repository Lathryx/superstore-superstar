extends CanvasLayer
	
@onready var pause_background = $PauseBackground
@onready var buttons = $PauseBackground/VBoxContainer

func _ready() -> void:
	pause_background.size = get_viewport().size
	buttons.position.x -= get_viewport().size.x/20
	buttons.position.y -= get_viewport().size.x/20
	#buttons.add_theme_constant_override("separation", get_viewport().size.x/20)
	buttons.size.x = get_viewport().size.x/5
	buttons.size.y = get_viewport().size.y/5
	print(get_viewport().size/5, buttons.size/2)
	

func _on_resume_pressed() -> void:
	$"../".pauseMenu()


func _on_quit_pressed() -> void:
	get_tree().quit()
