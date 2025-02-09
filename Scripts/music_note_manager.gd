extends Node2D

@export var music_note_scene: PackedScene 

func _on_player_strum(pos, dir) -> void:
	var music_note = music_note_scene.instantiate() 
	#print(dir.normalized(), dir) 
	add_child(music_note) 
	music_note.position = pos 
	music_note.direction = dir.normalized() 
	music_note.add_to_group("music_notes") 
