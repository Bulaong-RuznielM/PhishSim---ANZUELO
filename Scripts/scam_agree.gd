extends Node2D


func _on_continiue_report_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/email.tscn")