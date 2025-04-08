extends Node2D


func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/task4_explanation_after.tscn")


func _on_st_url_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/url_list/1st URL.tscn")

func _on_nd_url_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/url_list/2nd URL.tscn")

func _on_rd_url_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/url_list/3rd url.tscn")

func _on_th_url_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/url_list/4th URL.tscn")

func _on_five_url_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/url_list/5th URL.tscn")
