extends Control

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/upgrades.tscn")


func _on_tasks_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Task.tscn")
