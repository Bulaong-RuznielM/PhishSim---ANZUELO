extends Node2D

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 2/email.tscn")
	
func _on_legit_email_agree_pressed() -> void:
	Global.task_2_interact[Global.task_2_interact_email_button] = true
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 2/Task2_Report.tscn")

func _on_legit_email_report_pressed() -> void:
	Global.task_2_interact[Global.task_2_interact_email_button] = true
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 2/Task2_Agree.tscn")
