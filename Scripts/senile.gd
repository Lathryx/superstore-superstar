extends CharacterBody2D

@export var target: Node2D 

var speed: int 
var acceleration = 7 

@onready var navigation_agent: NavigationAgent2D = $Navigation/NavigationAgent2D 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var num_types = 2 
	var path = "res://Resources/senile%d.tres" % (randi() % num_types + 1) 
	#print(path) 
	$AnimatedSprite2D.sprite_frames = load(path) 
	speed = randi_range(60, 80) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO 
	
	direction = navigation_agent.get_next_path_position() - global_position 
	direction = direction.normalized() 
	$AnimatedSprite2D.flip_h = true if direction.x > 0 else false 
		
	if direction == Vector2.ZERO: 
		$AnimatedSprite2D.animation = "idle" 
	else: 
		$AnimatedSprite2D.animation = "walk" 
		$AnimatedSprite2D.play() 
	
	velocity = velocity.lerp(direction*speed, acceleration*delta) 
	
	move_and_slide() 
	
func _on_nav_timer_timeout() -> void:
	navigation_agent.target_position = target.global_position 

func _on_hurt_box_received_damage(value): 
	modulate = Color(1, 0.2, 0.2) 
	await get_tree().create_timer(1.0).timeout 
	modulate = Color.WHITE 

func _on_health_depleted(): 
	queue_free() 
