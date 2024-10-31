extends Control

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/upgrades.tscn")


func _on_tasks_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/Task.tscn")


func _on_email_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/email.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/Setting.tscn")
