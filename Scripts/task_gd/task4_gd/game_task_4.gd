extends Node2D

func _ready() -> void:
	# Ensure Global.task_4_remove_task is initialized as an array
	if not (Global.task_4_remove_task is Array):
		Global.task_4_remove_task = []
	
	for task in Global.task_4_remove_task:
		add_in_array_and_remove_card(task)

func add_in_array_and_remove_card(node_path: String) -> void:
	var vbox_container = $MAIN/Control/TextureRect/TextureRect/Banner/ScrollContainer/VBoxContainer
	
	if vbox_container.has_node(node_path):
		var task_node = vbox_container.get_node(node_path)
		
		if not Global.task_4_remove_task.has(node_path):
			Global.task_4_remove_task.append(node_path)
		
		task_node.queue_free()
	else:
		print("Node not found:", node_path)

func _on_exit_button_pressed() -> void:
	Global.task_4_remove_task = []
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/task4_explanation_after.tscn")


func _on_st_url_pressed() -> void:
	add_in_array_and_remove_card("1st URL")
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/url_list/1st URL.tscn")

func _on_nd_url_pressed() -> void:
	add_in_array_and_remove_card("2nd URL")
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/url_list/2nd URL.tscn")

func _on_rd_url_pressed() -> void:
	add_in_array_and_remove_card("3rd URL")
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/url_list/3rd url.tscn")

func _on_th_url_pressed() -> void:
	add_in_array_and_remove_card("4th URL")
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/url_list/4th URL.tscn")

func _on_five_url_pressed() -> void:
	add_in_array_and_remove_card("5th URL")
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 4/url_list/5th URL.tscn")
