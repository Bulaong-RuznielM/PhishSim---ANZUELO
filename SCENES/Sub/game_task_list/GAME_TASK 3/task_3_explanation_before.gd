extends Control




func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/task.tscn")


func _on_understand_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 3/GAME_TASK_3.tscn")


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 3/GAME_TASK_3.tscn")
