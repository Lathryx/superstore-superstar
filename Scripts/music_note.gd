extends RigidBody2D 

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
	#position += direction * speed * delta 
	move_and_collide(direction*speed*delta) 

func _on_health_depleted(): 
	set_physics_process(false) 
	#$HitBox.monitoring = false 
	#$HitBox/CollisionShape2D.set_deferred("disabled", true) 
	#print($HitBox/CollisionShape2D.disabled) 
	#$AnimatedSprite2D.animation = "vanish" 
	#await get_tree().create_timer(0.5).timeout 
	queue_free() 
	
#func play_vanish(): 
	#var poof = AnimatedSprite2D.new() 
	#poof.sprite_frames = load("res://Resources/poof.tres") 
	#add_child(poof) 
	#poof.play() 
	#await get_tree().create_timer(0.5).timeout 
	#poof.queue_free() 
