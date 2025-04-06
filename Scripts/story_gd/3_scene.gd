extends Node2D




func _on_skip_3_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/start_story_gameplay/4scene.tscn")


func _on_skip_story_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/Game_Tutorial/Tutorial_INITIAL.tscn")
