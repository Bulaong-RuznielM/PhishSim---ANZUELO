extends Control


func _on_email_task_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/email.tscn")


func _on_scam_agree_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/scam_agree.tscn")


func _on_scam_report_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/scam_report.tscn")
