class_name HitBox 
extends Area2D 

@export var damage: int = 1: set = set_damage, get = get_damage 
@export var projectile: bool 
#var collided: bool = false: set = set_collided, get = get_collided 

func set_damage(value: int): 
	damage = value 
	
func get_damage() -> int: 
	return damage 
	
#func set_collided(value: bool): 
	#collided = value 
	#
#func get_collided() -> bool: 
	#return collided 
