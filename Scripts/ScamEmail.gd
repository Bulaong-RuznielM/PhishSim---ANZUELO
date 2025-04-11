extends Control


func _on_email_task_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 2/email.tscn")


func _on_scam_agree_button_pressed() -> void:
	Global.task_2_interact[Global.task_2_interact_email_button] = true
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 2/Task2_Agree.tscn")


func _on_scam_report_button_pressed() -> void:
	Global.task_2_interact[Global.task_2_interact_email_button] = true
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 2/Task2_Report.tscn")
