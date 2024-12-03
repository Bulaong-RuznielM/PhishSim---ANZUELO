extends Control

var status = false

func _ready():
	hide_all_containers()
	dynamic_setter("auto")

func hide_all_containers():
	status = false
	for i in range(15):
		var container_node = get_node_or_null("%Container" + str(i))
		if container_node:
			container_node.hide()

func get_random_profile():
	return str(randi() % Global.users.size())

func dynamic_setter(select):
	var whatUser = get_random_profile() if select == "auto" else str(select)
	
	# Accessing the nodes and updating text values
	%User_Label.text = Global.users[whatUser]["%user%"]
	%Username_Label.text = Global.users[whatUser]["%@username%"]
	%Usercomment_Label.text = Global.users[whatUser]["%user%intro"]
	%Userinfo_Label.text = Global.users[whatUser]["%user%info"]
	
	if (Global.users[whatUser]["%user%status"] == "Real"):
		status = true
	else:
		status = false


	
	# Loop to show and update comment containers
	for i in range(int(Global.users[whatUser]["%user%commentnumber"])):
		var container_node = get_node_or_null("%Container" + str(i))
		if container_node:
			container_node.show()

		var visblename_node = get_node_or_null("%Container" + str(i) + "/HBoxContainer/visblename")
		if visblename_node:
			visblename_node.text = Global.users[whatUser]["%user%"]

		var username_node = get_node_or_null("%Container" + str(i) + "/HBoxContainer/username")
		if username_node:
			username_node.text = Global.users[whatUser]["%@username%"]

		var check_node = get_node_or_null("%Container" + str(i) + "/HBoxContainer/_/Check")
		if check_node:
			if Global.users[whatUser]["%user%check"] == "True":
				check_node.show()
			else:
				check_node.hide()

		var comment_node = get_node_or_null("%Container" + str(i) + "/Comment")
		if comment_node:
			comment_node.text = Global.users[whatUser]["%user%blocks"][str(i)]["comment"]

		var reply_node = get_node_or_null("%Container" + str(i) + "/reply_Label")
		if reply_node:
			reply_node.text = Global.users[whatUser]["%user%blocks"][str(i)]["reply"]

		var repost_node = get_node_or_null("%Container" + str(i) + "/repost_Label")
		if repost_node:
			repost_node.text = Global.users[whatUser]["%user%blocks"][str(i)]["repost"]

		var like_node = get_node_or_null("%Container" + str(i) + "/like_Label_C")
		if like_node:
			like_node.text = Global.users[whatUser]["%user%blocks"][str(i)]["like"]

func _on_profile_finder_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/Task.tscn")

func _on_real_profile_button_pressed() -> void:
	if not status:
		get_tree().change_scene_to_file("res://SCENES/Sub/scam_report.tscn")
	else:
		get_tree().change_scene_to_file("res://SCENES/Sub/scam_agree.tscn")

func _on_report_profile_button_pressed() -> void:
	if status:
		get_tree().change_scene_to_file("res://SCENES/Sub/scam_report.tscn")
	else:
		get_tree().change_scene_to_file("res://SCENES/Sub/scam_agree.tscn")
