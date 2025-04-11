extends Node2D

func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/Task.tscn")

var current_question = 1
var current_question_real = true
var correct_answers = 0
var answered_answers = []
var total_questions = 0
var win_limit_needed = 4
var shyuJGSDF=0

@onready var question_label = $WindowsBorder.get_node_or_null("QUESTION")

func _ready():
	shuffle_messages()  # shuffle first
	randomize_and_delete()
	delete_random_messages()  # delete from UI
	display_name_number()
	display_message(1)

# Ensure shuffled messages are properly initialized
var shuffled_messages = []

func delete_random_messages():
	var vbox = $ScrollContainer/VBoxContainer
	var visible_count = vbox.get_child_count()
	
	# Make sure we only keep as many messages as visible TextureRects
	shuffled_messages = shuffled_messages.slice(0, visible_count)
	print(shuffled_messages)

func shuffle_messages():
	var message_list = messages.keys()
	message_list.shuffle()
	shuffled_messages.clear()
	for key in message_list:
		shuffled_messages.append(messages[key])

func randomize_and_delete() -> void:
	total_questions = $ScrollContainer/VBoxContainer.get_child_count()
	var random_number = randi_range(1, shuffled_messages.size())  # Ensure random number doesn't exceed available messages
	print(random_number)
	
	# Clone shuffled messages and remove a certain number of entries based on random_number
	var shuffled_messages_to_remove = []

	var start_index = random_number  # Setting start index based on the random number

	for i in range(start_index, total_questions):
		var texture_rect_path = "ScrollContainer/VBoxContainer/TextureRect" + str(i + 1)  # Adding 1 to match the node numbering
		var texture_rect = get_node(texture_rect_path)
		if texture_rect:
			# Perform action on the texture_rect (for example, queue_free to remove it)
			texture_rect.queue_free()
			print("Removed TextureRect at path: ", texture_rect_path)

	# Remove TextureRect nodes from the UI based on the number of elements to delete
	for i in range(shuffled_messages_to_remove.size()):
		for child in $ScrollContainer/VBoxContainer.get_children():
			if child is TextureRect:
				var label = child.get_node("Label")
				if label and label.text == shuffled_messages_to_remove[i]["name"]:  # Ensure the name matches
					child.queue_free()  # Remove the TextureRect from the UI
					break  # Exit after removing the relevant TextureRect

	# Update the shuffled_messages list by erasing the deleted elements
	for element in shuffled_messages_to_remove:
		shuffled_messages.erase(element)

	# Update the total number of questions to the random number selected
	total_questions = random_number
	shyuJGSDF = random_number
	print(total_questions)




var messages = {
	1: {"uid": "1", "name": "Gift Card Offer", "number": "12345", "content": "You've won a free gift card! Click here to claim your prize.", "is_real": false},
	2: {"uid": "2", "name": "Delivery Service", "number": "98765", "content": "Your package is out for delivery. Track it here: <error>", "is_real": true},
	3: {"uid": "3", "name": "Bank Support", "number": "54321", "content": "Bank Alert: Suspicious activity detected. Verify your account immediately.", "is_real": false},
	4: {"uid": "4", "name": "Doctor's Office", "number": "11223", "content": "Reminder: Your doctor's appointment is scheduled for tomorrow at 10 AM.", "is_real": true},
	5: {"uid": "5", "name": "Prize Claim", "number": "67890", "content": "Congratulations! You've been selected for a cash prize. Reply with your bank details.", "is_real": false},
	6: {"uid": "6", "name": "Friend", "number": "33445", "content": "Your friend sent you a photo. View it here: <error>", "is_real": false},
	7: {"uid": "7", "name": "Subscription Service", "number": "55667", "content": "Your subscription has been renewed successfully. Thank you for your payment.", "is_real": true},
	8: {"uid": "8", "name": "Security Alert", "number": "99887", "content": "Urgent: Your account will be locked unless you verify your information now.", "is_real": false},
	9: {"uid": "9", "name": "Airline", "number": "66778", "content": "Your flight has been rescheduled. Check the new itinerary here.", "is_real": true},
	10: {"uid": "10", "name": "Voicemail Service", "number": "22334", "content": "You've received a voicemail. Listen to it here: <error>", "is_real": false},
	11: {"uid": "11", "name": "Tech Support", "number": "90909", "content": "Your computer has a virus! Call this number immediately for assistance.", "is_real": false},
	12: {"uid": "12", "name": "Charity Donation", "number": "55678", "content": "Donate to help disaster victims. Send your credit card details to contribute.", "is_real": false},
	13: {"uid": "13", "name": "Electric Company", "number": "33489", "content": "Your electricity bill is overdue. Pay now to avoid disconnection.", "is_real": true},
	14: {"uid": "14", "name": "Lottery Winner", "number": "11229", "content": "You won the lottery! Claim your prize by sending your ID details.", "is_real": false},
	15: {"uid": "15", "name": "Streaming Service", "number": "77331", "content": "Your streaming subscription is about to expire. Renew it here: <error>", "is_real": false},
	16: {"uid": "16", "name": "Pharmacy Reminder", "number": "66255", "content": "Your prescription refill is ready for pickup at your local pharmacy.", "is_real": true},
	17: {"uid": "17", "name": "Job Offer", "number": "99882", "content": "Exciting job opportunity! Click the link to submit your personal information.", "is_real": false},
	18: {"uid": "18", "name": "Health Insurance", "number": "22566", "content": "Your health insurance policy has been updated. Review the new terms here.", "is_real": true},
	19: {"uid": "19", "name": "Government Alert", "number": "55612", "content": "You have unpaid taxes. Pay now to avoid legal consequences.", "is_real": false},
	20: {"uid": "20", "name": "Gym Membership", "number": "88199", "content": "Your gym membership has been renewed successfully.", "is_real": true}
}

var answered_questions = []

func real_report_delete(verified: bool):
	answered_answers.append(current_question)  # Track answered questions
	if current_question <= 0:
		return
	
	# Delete TextureRect by UID
	delete_texturerect_by_uid(shuffled_messages[current_question - 1]["uid"])
	
	# Update correct answer count
	$correct.text = "Correct Answer: " + str(correct_answers)
	
	# Check if the answer is correct
	if current_question_real == verified:
		correct_answers += 1
		$correct.text = "Correct Answer: " + str(correct_answers)
		answered_questions.append(current_question)
	
	# Check if all questions have been answered
	if answered_answers.size() == shyuJGSDF && current_question >= shyuJGSDF:
		if correct_answers >= win_limit_needed:
			get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 3/Task3_Win.tscn")
		else:
			get_tree().change_scene_to_file("res://SCENES/Sub/game_task_list/GAME_TASK 3/Task3_Lose.tscn")
	else:
		move_to_next_unanswered_question()


func delete_texturerect_by_uid(target_uid: String) -> void:
	var vbox = $ScrollContainer/VBoxContainer
	for index in range(vbox.get_child_count()):
		var texture_rect = vbox.get_child(index)
		if texture_rect is TextureRect:
			var uid_node = texture_rect.get_node("uid")
			if uid_node and uid_node.text == target_uid:
				texture_rect.queue_free()
				return

func all_questions_answered() -> bool:
	for i in range(1, shuffled_messages.size() + 1):
		if not answered_questions.has(i):
			return false
	return true

func move_to_next_unanswered_question() -> void:
	for i in range(current_question + 1, shuffled_messages.size() + 1):
		if not answered_questions.has(i):
			current_question = i
			display_message(current_question)
			return

func display_name_number():
	var vbox = $ScrollContainer/VBoxContainer
	for index in range(vbox.get_child_count()):
		var texture_rect = vbox.get_child(index)
		if texture_rect is TextureRect:
			var label = texture_rect.get_node("Label")
			var label2 = texture_rect.get_node("Label2")
			var uid = texture_rect.get_node("uid")
			if label and label2 and uid:
				if index < shuffled_messages.size():
					label.text = shuffled_messages[index]["name"]
					label2.text = shuffled_messages[index]["number"]
					uid.text = shuffled_messages[index]["uid"]
				else:
					pass
			else:
				pass

func display_message(index: int):
	$WindowsBorder/QUESTION.text = ""
	current_question = index
	if shuffled_messages.is_empty():
		return
	var adjusted_index = index - 1
	if adjusted_index < 0 or adjusted_index >= shuffled_messages.size():
		return
	$WindowsBorder/QUESTION.text = shuffled_messages[adjusted_index]["content"]
	current_question_real = shuffled_messages[adjusted_index]["is_real"]

func _on_texture_rect_mouse_entered() -> void:
	display_message(1)

func _on_texture_rect_2_mouse_entered() -> void:
	display_message(2)

func _on_texture_rect_3_mouse_entered() -> void:
	display_message(3)

func _on_texture_rect_4_mouse_entered() -> void:
	display_message(4)

func _on_texture_rect_5_mouse_entered() -> void:
	display_message(5)

func _on_texture_rect_6_mouse_entered() -> void:
	display_message(6)

func _on_texture_rect_7_mouse_entered() -> void:
	display_message(7)

func _on_texture_rect_8_mouse_entered() -> void:
	display_message(8)

func _on_texture_rect_9_mouse_entered() -> void:
	display_message(9)

func _on_texture_rect_10_mouse_entered() -> void:
	display_message(10)

func _on_texture_rect_11_mouse_entered() -> void:
	display_message(11)

func _on_texture_rect_12_mouse_entered() -> void:
	display_message(12)

func _on_texture_rect_13_mouse_entered() -> void:
	display_message(13)

func _on_texture_rect_14_mouse_entered() -> void:
	display_message(14)

func _on_texture_rect_15_mouse_entered() -> void:
	display_message(15)

func _on_texture_rect_16_mouse_entered() -> void:
	display_message(16)

func _on_texture_rect_17_mouse_entered() -> void:
	display_message(17)

func _on_texture_rect_18_mouse_entered() -> void:
	display_message(18)

func _on_texture_rect_19_mouse_entered() -> void:
	display_message(19)

func _on_texture_rect_20_mouse_entered() -> void:
	display_message(20)

func _on_scam_pressed() -> void:
	real_report_delete(false)

func _on_real_pressed() -> void:
	real_report_delete(true)
