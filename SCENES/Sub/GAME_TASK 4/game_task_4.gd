extends Node2D


func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/Task.tscn")


func _on_st_url_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/GAME_TASK 4/1st URL.tscn")

func _on_nd_url_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/GAME_TASK 4/2nd URL.tscn")

func _on_rd_url_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/GAME_TASK 4/3rd url.tscn")

func _on_th_url_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/GAME_TASK 4/4th URL.tscn")

func _on_five_url_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/GAME_TASK 4/5th URL.tscn")
