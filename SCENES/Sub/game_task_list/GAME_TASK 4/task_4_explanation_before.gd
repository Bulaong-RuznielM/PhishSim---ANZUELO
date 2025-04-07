extends Control


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/Task.tscn")


func _on_understand_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/GAME_TASK_4.tscn")


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/GAME_TASK_4.tscn")
