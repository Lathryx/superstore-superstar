extends CharacterBody2D

const max_speed = 125 
const accel = 3000 
const friction = 1500 

func _ready(): 
	pass 
	
func _physics_process(delta: float) -> void: 
	var direction = Vector2.ZERO 
	
	if Input.is_action_pressed("move_left"): 
		direction.x -= 1 
		$AnimatedSprite2D.flip_h = false 
	if Input.is_action_pressed("move_right"): 
		direction.x += 1 
		$AnimatedSprite2D.flip_h = true 
	if Input.is_action_pressed("move_up"): 
		direction.y -= 1 
	if Input.is_action_pressed("move_down"): 
		direction.y += 1 
		
	direction = direction.normalized() 
	
	if direction == Vector2.ZERO: 
		if velocity.length() > friction*delta: 
			velocity -= friction * velocity.normalized() * delta 
		else: 
			velocity = Vector2.ZERO 
		$AnimatedSprite2D.animation = "idle" 
	else: 
		velocity += accel * direction * delta 
		velocity = velocity.limit_length(max_speed) 
		$AnimatedSprite2D.animation = "walk" 
		$AnimatedSprite2D.play() 
		
	move_and_slide() 
	
	position = position.clamp(Vector2.ZERO, get_node("../FloorLayer").get_used_rect().size*16)  
