extends Node2D

var used_rect 

func _ready():
	used_rect = $FloorLayer.get_used_rect().size 
	 
	$Player/Camera2D.limit_top = 0 
	$Player/Camera2D.limit_left = 0 
	$Player/Camera2D.limit_bottom = used_rect.y*16 
	$Player/Camera2D.limit_right = used_rect.x*16 
