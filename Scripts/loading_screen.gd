extends CanvasLayer

func _ready(): 
	$LoadingBackground.size = get_viewport().size 
	$LoadingBackground/LoadingLabel.position -= Vector2(get_viewport().size)/20 
	$LoadingBackground/LoadingLabel.size = get_viewport().size/5 
