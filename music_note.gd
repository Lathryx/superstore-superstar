extends Node2D

var direction: Vector2 
var speed = 80 
var health = 8 


func _ready() -> void:
	var num_types = 3 
	var path = "res://musicnote%d.tres" % (randi() % num_types + 1)
	$AnimatedSprite2D.sprite_frames = load(path) 
	#print("hello")
	#print($AnimatedSprite2D.sprite_frames) 


func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position()) 
	

func _process(delta): 
	position += direction * speed * delta 
