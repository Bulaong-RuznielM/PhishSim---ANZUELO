extends Control

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/upgrades.tscn")


func _on_tasks_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Task.tscn")


func _on_email_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/email.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Setting.tscn")
