extends CharacterBody2D

signal strum 

const max_speed = 125 
const accel = 3000 
const friction = 1500 

func _ready(): 
	$AnimatedSprite2D.play() 
	
func _physics_process(delta: float) -> void: 
	var direction = Vector2.ZERO 
	var strumming = Input.is_action_pressed("strum") 
	
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
		$AnimatedSprite2D.animation = "idle_attack" if strumming or not $StrumTimer.is_stopped() else "idle"
	
	else: 
		velocity += accel * direction * delta 
		velocity = velocity.limit_length(max_speed) 
		$AnimatedSprite2D.animation = "walk_attack" if strumming or not $StrumTimer.is_stopped() else "walk"
		
	move_and_slide() 

	if Input.is_action_pressed("strum"): 
		if not $StrumTimer.is_stopped(): return 
		var dir = get_global_mouse_position() - position 
		strum.emit(position, dir) 
		$StrumTimer.start() 
