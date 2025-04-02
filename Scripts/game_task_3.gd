extends Node2D

func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/Task.tscn")

var current_question = 1
var current_question_real = true
var correct_answers = 0
var answered_answers = []
var total_questions = 0
@onready var question_label = $WindowsBorder.get_node_or_null("QUESTION")

func _ready():
	randomize()
	shuffle_messages()
	call_deferred("display_question", current_question)
	for child in $ScrollContainer/VBoxContainer.get_children():
		if child is Control:
			total_questions += 1

var messages = {
	1: {"content": "You've won a free gift card! Click here to claim your prize.", "is_real": false},
	2: {"content": "Your package is out for delivery. Track it here: [legitimate tracking link]", "is_real": true},
	3: {"content": "Bank Alert: Suspicious activity detected. Verify your account immediately.", "is_real": false},
	4: {"content": "Reminder: Your doctor's appointment is scheduled for tomorrow at 10 AM.", "is_real": true},
	5: {"content": "Congratulations! You've been selected for a cash prize. Reply with your bank details.", "is_real": false},
	6: {"content": "Your friend sent you a photo. View it here: [malicious link]", "is_real": false},
	7: {"content": "Your subscription has been renewed successfully. Thank you for your payment.", "is_real": true},
	8: {"content": "Urgent: Your account will be locked unless you verify your information now.", "is_real": false},
	9: {"content": "Your flight has been rescheduled. Check the new itinerary here: [legitimate link]", "is_real": true},
	10: {"content": "You've received a voicemail. Listen to it here: [malicious link]", "is_real": false}
}

var shuffled_messages = []

func shuffle_messages():
	# Convert dictionary to an array of key-value pairs
	var message_list = messages.keys()
	message_list.shuffle()  # Shuffle the keys
	
	shuffled_messages.clear()
	for key in message_list:
		shuffled_messages.append(messages[key])
		
#func display_question(question_number):
#	if question_label and question_number in messages:
#		question_label.text = "Message %d: %s" % [question_number, messages[question_number].content]
#	else:
#		print("No message found for number %d" % question_number)
#
#func process_answer(user_choice):
#	if current_question in messages:
#		if messages[current_question].is_real == user_choice:
#			correct_answers += 1
#			print("Correct! Total correct answers: %d" % correct_answers)
#			if correct_answers >= 5:
#				on_five_correct_answers()
#		else:
#			incorrect_answers += 1
#			print("Incorrect. Total incorrect answers: %d" % incorrect_answers)
#			if incorrect_answers >= 5:
#				on_five_incorrect_answers()
#		current_question += 1
#		if current_question <= total_questions:
#			display_question(current_question)
#		else:
#			print("Quiz completed.")
#	else:
#		print("No message found for question %d" % current_question)
#		
#func on_five_correct_answers():
#	get_tree().change_scene_to_file("res://SCENES/Sub/scam_report.tscn")
#	
#func on_five_incorrect_answers():
#	get_tree().change_scene_to_file("res://SCENES/Sub/scam_report.tscn")
#




func display_message(index: int):
	$WindowsBorder/QUESTION.text = ""
	current_question = index
	
	# Check if index is within valid range
	if shuffled_messages.is_empty():
		print("Error: shuffled_messages is empty")
		return
	
	if index < 0 or index >= shuffled_messages.size():
		print("Error: Invalid index ", index)
		return

	# Display message
	$WindowsBorder/QUESTION.text = shuffled_messages[index].content
	current_question_real = shuffled_messages[index].is_real


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
