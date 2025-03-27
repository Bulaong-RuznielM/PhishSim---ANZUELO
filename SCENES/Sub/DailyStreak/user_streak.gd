extends Node2D



func _on_streak_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/Game.tscn")
