extends Control

func _on_email_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/task.tscn")
