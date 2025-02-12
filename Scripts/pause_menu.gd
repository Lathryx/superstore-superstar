extends CanvasLayer
	
@onready var pause_background = $PauseBackground
@onready var buttons = $PauseBackground/VBoxContainer
@onready var resumeSprite = $PauseBackground/VBoxContainer/ResumeAnimatedSprite2D
@onready var quitSprite = $PauseBackground/VBoxContainer/QuitAnimatedSprite2D
var paused = false
@onready var pause_menu = $PauseMenu 


func _ready() -> void:
	#pause_background.size = get_viewport().size
	#buttons.add_theme_constant_override("separation", get_viewport().size.x/20)
	#buttons.size.x = get_viewport().size.x/5
	#buttons.size.y = get_viewport().size.y/5
	resumeSprite.play()
	quitSprite.play()
	#print(get_viewport().size/5, buttons.size/2)
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		$"../../../../".pauseMenu()



func _on_resume_pressed() -> void:
	$"../../../../".pauseMenu()


func _on_quit_pressed() -> void:
	get_tree().quit()
