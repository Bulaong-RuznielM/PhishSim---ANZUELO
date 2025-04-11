extends Node2D

func _ready():
	if not (Global.task_4_remove_task is Dictionary):
		Global.task_4_remove_task = {}
	if not (Global.task_4_interact is Dictionary):
		Global.task_4_interact = {}

	var vbox_container = $MAIN/Control/TextureRect/TextureRect/Banner/ScrollContainer/VBoxContainer
	for child in vbox_container.get_children():
		var node_name = child.name
		Global.task_4_remove_task[node_name] = false

func _process(_delta: float) -> void:
	var vbox_container = $MAIN/Control/TextureRect/TextureRect/Banner/ScrollContainer/VBoxContainer
	for node_name in Global.task_4_remove_task.keys():
		if Global.task_4_remove_task[node_name]:
			continue
		if Global.task_4_interact.get(node_name, false):
			var node = vbox_container.get_node(node_name)
			if node:
				node.queue_free()
				Global.task_4_remove_task[node_name] = true


func _on_exit_button_pressed() -> void:
	Global.task_4_remove_task = []
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/task4_explanation_after.tscn")


func _on_st_url_pressed() -> void:
	Global.task_4_interact_email_button = "1st URL"
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/url_list/1st URL.tscn")

func _on_nd_url_pressed() -> void:
	Global.task_4_interact_email_button = "2nd URL"
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/url_list/2nd URL.tscn")

func _on_rd_url_pressed() -> void:
	Global.task_4_interact_email_button = "3rd URL"
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/url_list/3rd url.tscn")

func _on_th_url_pressed() -> void:
	Global.task_4_interact_email_button = "4th URL"
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/url_list/4th URL.tscn")

func _on_five_url_pressed() -> void:
	Global.task_4_interact_email_button = "5th URL"
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/url_list/5th URL.tscn")
