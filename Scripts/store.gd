extends Node2D

@export var senile_scene: PackedScene 

var used_rect 

func _ready():
	used_rect = $NavigationRegion2D/FloorLayer.get_used_rect().size 
	
	$NavigationRegion2D/Player/Camera2D.limit_top = 0 
	$NavigationRegion2D/Player/Camera2D.limit_left = 0 
	$NavigationRegion2D/Player/Camera2D.limit_bottom = used_rect.y*16 
	$NavigationRegion2D/Player/Camera2D.limit_right = used_rect.x*16 
	$SenileTimer.start() 
	$Music.connect("finished", Callable(self,"_on_loop_sound").bind($Music)) 
	$Music.play() 
	

func _on_loop_sound(player):
	player.play() 
	
func _on_senile_timer_timeout(): 
	var senile = senile_scene.instantiate() 
	senile.set_deferred("target", $NavigationRegion2D/Player) 
	
	var senile_spawn_location = $SenilePath/SenileSpawnLocation 
	senile_spawn_location.progress_ratio = randf() 
	
	senile.position = senile_spawn_location.position 
	
	add_child(senile) 
	#print("added senile") 
