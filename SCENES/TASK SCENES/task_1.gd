extends Node2D

func spawn_popup():
	var new_popup = preload("res://SCENES/phishing_popup.tscn").instantiate()
	%PopUpSpawnLocation.progress_ratio = randf()
	new_popup.global_position = %PopUpSpawnLocation.global_position
	add_child(new_popup)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Task.tscn")


func _on_timer_timeout() -> void:
	spawn_popup()
