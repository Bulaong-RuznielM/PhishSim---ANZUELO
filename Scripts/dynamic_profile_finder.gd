extends Control

var status = false

func _ready():
	hideAllContaners()
	dynamicSetter("auto")

func hideAllContaners():
	status = false
	for i in range(15):
		var container_node = get_node_or_null("%Container" + str(i))
		if container_node:
			container_node.hide()

func getrAndProfile():
	return (randi() % Global.users.size())

func dynamicSetter(sellect):
	var whatUser = str(getrAndProfile()) if sellect == "auto" else sellect
	
	# Accessing the nodes using the correct $ syntax
	%User_Label.text = Global.users[whatUser]["%user%"]
	%Username_Label.text = Global.users[whatUser]["%@username%"]
	%Usercomment_Label.text = Global.users[whatUser]["%user%intro"]
	%Userinfo_Label.text = Global.users[whatUser]["%user%info"]
	
	status = Global.users[whatUser]["%user%check"] == "True"
	
	# Loop to show and update comments and other information
	for i in range(int(Global.users[whatUser]["%user%commentnumber"])):  # Use int for range
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
	get_tree().change_scene_to_file("res://SCENES/Sub/scam_report.tscn") if status == true else get_tree().change_scene_to_file("res://SCENES/Sub/scam_agree.tscn")


func _on_report_profile_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/scam_agree.tscn") if status == true else get_tree().change_scene_to_file("res://SCENES/Sub/scam_report.tscn")
