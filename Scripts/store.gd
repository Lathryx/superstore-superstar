extends Node2D

@export var senile_scene: PackedScene 

@onready var pause_menu = $NavigationRegion2D/Player/Camera2D/PauseMenu 
var paused = false
var used_rect 


func _ready():
	used_rect = $NavigationRegion2D/FloorLayer.get_used_rect().size 
	pause_menu.hide()
	$NavigationRegion2D/Player/Camera2D.limit_top = 0 
	$NavigationRegion2D/Player/Camera2D.limit_left = 0 
	$NavigationRegion2D/Player/Camera2D.limit_bottom = used_rect.y*16 
	$NavigationRegion2D/Player/Camera2D.limit_right = used_rect.x*16 
	$SenileTimer.start() 
	$Music.connect("finished", Callable(self,"_on_loop_sound").bind($Music)) 
	$Music.play() 

	
		
func _physics_process(_delta: float) -> void:
	$NavigationRegion2D/Player.position.x = clamp($NavigationRegion2D/Player.position.x, 0.0, $NavigationRegion2D/FloorLayer.get_used_rect().size.x*16)
	$NavigationRegion2D/Player.position.y = clamp($NavigationRegion2D/Player.position.y, 0.0, $NavigationRegion2D/FloorLayer.get_used_rect().size.y*16)
	
func pauseMenu():
	paused = !paused
	if paused:
		pause_menu.show()
		get_tree().paused = true
	else:
		pause_menu.hide()
		get_tree().paused = false
	
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
