extends Control

func _on_task_1_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/Task_1.tscn")

func _on_task_2_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/emailtask.tscn")

func _on_hide_task_2_pressed() -> void:
	%Task_2.visible = false


func _on_show_task_2_pressed() -> void:
	%Task_2.visible = true
	
	
#My non experienced coder brain thinks that there is a better way to do this but
#Im too inexeperienced to fix it.
#The good thing is, is that it works
func _on_show_all_tasks_pressed() -> void:

	%Task_2.visible = true

	%Task_3.visible = true

	%Task_4.visible = true

	%Task_5.visible = true

	%Task_6.visible = true

	%Task_7.visible = true

	%Task_8.visible = true

	

func _on_hide_all_tasks_pressed() -> void:

	%Task_2.visible = false

	%Task_3.visible = false

	%Task_4.visible = false

	%Task_5.visible = false

	%Task_6.visible = false

	%Task_7.visible = false

	%Task_8.visible = false
