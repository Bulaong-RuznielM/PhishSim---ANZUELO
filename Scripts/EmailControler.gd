extends TextureRect

func _ready():
	if not (Global.task_2_remove_task is Dictionary):
		Global.task_2_remove_task = {}
	if not (Global.task_2_interact is Dictionary):
		Global.task_2_interact = {}

	var vbox_container = $ScrollContainer/VBoxContainer
	for child in vbox_container.get_children():
		var node_name = child.name
		Global.task_2_remove_task[node_name] = false

func _process(_delta: float) -> void:
	var vbox_container = $ScrollContainer/VBoxContainer
	for node_name in Global.task_2_remove_task.keys():
		if Global.task_2_remove_task[node_name]:
			continue
		if Global.task_2_interact.get(node_name, false):
			var node = vbox_container.get_node(node_name)
			if node:
				node.queue_free()
				Global.task_2_remove_task[node_name] = true

func _on_email_button_1_pressed() -> void:
	Global.task_2_interact_email_button = "Email1Task"
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 2/ScamEmaildesc.tscn")


func _on_email_button_2_pressed() -> void:
	Global.task_2_interact_email_button = "Email2Task"
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 2/Legitimate.tscn")


func _on_email_button_3_pressed() -> void:
	Global.task_2_interact_email_button = "Email3Task"
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 2/ScamEmaildesc.tscn")


func _on_email_4_button_pressed() -> void:
	Global.task_2_interact_email_button = "Email4Task"
	get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 2/Legitimate.tscn")
