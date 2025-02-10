extends Node2D

var direction: Vector2 
var speed = 80 

func _ready() -> void:
	var num_types = 3 
	var path = "res://Resources/musicnote%d.tres" % (randi() % num_types + 1)
	$AnimatedSprite2D.sprite_frames = load(path) 
	$AnimatedSprite2D.play()
	#print("hello")
	#print($AnimatedSprite2D.sprite_frames) 


func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position()) 
	position += direction * speed * delta 
	

func _process(delta): 
	pass
