extends Node2D

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/Game.tscn")
	
func _on_legit_email_agree_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/scam_report.tscn")

func _on_legit_email_report_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/scam_agree.tscn")
