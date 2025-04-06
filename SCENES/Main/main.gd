extends Node

func _ready():
	call_deferred("_change_to_intro_scene")

func _change_to_intro_scene():
	get_tree().change_scene_to_file("res://SCENES/Main/intro_animation.tscn")
