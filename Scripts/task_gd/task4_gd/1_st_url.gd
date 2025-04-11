extends Node2D




func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/GAME_TASK_4.tscn")

# true
func _on_legit_pressed() -> void:
	Global.task_4_interact[Global.task_4_interact_email_button] = true
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/Task4_Report.tscn")

func _on_phishing_pressed() -> void:
	Global.task_4_interact[Global.task_4_interact_email_button] = true
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/Task4_Report.tscn")
