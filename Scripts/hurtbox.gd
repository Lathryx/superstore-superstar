class_name HurtBox 
extends Area2D 

signal received_damage(damange: int) 

@export var health: Health 
@export var projectile: bool 

func _ready(): 
	connect("area_entered", _on_area_entered) 
	
func _on_area_entered(hitbox: HitBox) -> void: 
	if hitbox != null: # and not hitbox.collided 
		health.health -= hitbox.damage 
		received_damage.emit(hitbox.damage) 
		if hitbox.projectile: hitbox.set_deferred("monitorable", false) 
		print(hitbox.projectile, hitbox.monitorable) 
		#hitbox.collided = true 
		#hitbox.monitoring = false 
		#hitbox.get_node("CollisionShape2D").set_deferred("disabled", true) 
		#print(hitbox.get_node("CollisionShape2D").disabled) 
		#print("HURT") 
