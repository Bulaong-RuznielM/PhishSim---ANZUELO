extends Node2D

func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/Task.tscn")

var current_question = 1
var current_question_real = true
var correct_answers = 0
var answered_answers = []
var total_questions = 0
var win_limit_needed = 4
@onready var question_label = $WindowsBorder.get_node_or_null("QUESTION")

func _ready():
	shuffle_messages()
	display_name_number()
	print(shuffled_messages)

	call_deferred("display_question", current_question)
	for child in $ScrollContainer/VBoxContainer.get_children():
		if child is Control:
			total_questions += 1

var messages = {
	1: {"name": "Gift Card Offer", "number": "12345", "content": "You've won a free gift card! Click here to claim your prize.", "is_real": false},
	2: {"name": "Delivery Service", "number": "98765", "content": "Your package is out for delivery. Track it here: <error>", "is_real": true},
	3: {"name": "Bank Support", "number": "54321", "content": "Bank Alert: Suspicious activity detected. Verify your account immediately.", "is_real": false},
	4: {"name": "Doctor's Office", "number": "11223", "content": "Reminder: Your doctor's appointment is scheduled for tomorrow at 10 AM.", "is_real": true},
	5: {"name": "Prize Claim", "number": "67890", "content": "Congratulations! You've been selected for a cash prize. Reply with your bank details.", "is_real": false},
	6: {"name": "Friend", "number": "33445", "content": "Your friend sent you a photo. View it here: <error>", "is_real": false},
	7: {"name": "Subscription Service", "number": "55667", "content": "Your subscription has been renewed successfully. Thank you for your payment.", "is_real": true},
	8: {"name": "Security Alert", "number": "99887", "content": "Urgent: Your account will be locked unless you verify your information now.", "is_real": false},
	9: {"name": "Airline", "number": "66778", "content": "Your flight has been rescheduled. Check the new itinerary here", "is_real": true},
	10:{"name": "Voicemail Service", "number": "22334", "content": "You've received a voicemail. Listen to it here <error>", "is_real": false}
}

func real_report_delete(verified: bool):
	# Add current_question to answered_answers (this will happen regardless of whether it's right or wrong)
	answered_answers.append(current_question)

	# Remove the current question's TextureRect (this happens regardless of the verification result)
	var vbox = $ScrollContainer/VBoxContainer
	var texture_rect = vbox.get_child(current_question - 1)
	
	if texture_rect:
		texture_rect.queue_free()  # Remove the TextureRect from the scene
	else:
		print("Error: TextureRect not found.")

	# If the verification matches the message's "is_real" value, increase the correct_answers count
	if shuffled_messages[current_question].is_real == verified:
		correct_answers += 1  # Increment correct answers if verified correctly
		$correct.text = "Correct Answer: " + str(correct_answers)
		# If it's the last question, change scene based on correct answers
		if current_question == shuffled_messages.size():
			if correct_answers >= win_limit_needed:
				get_tree().change_scene_to_file("res://SCENES/Sub/scam_report.tscn")
			else:
				get_tree().change_scene_to_file("res://SCENES/Sub/scam_agree.tscn")
		else:
			current_question += 1  # Proceed to the next question
	else:
		print("Verification failed. No action taken.")
		$correct.text = "Correct Answer: " + str(correct_answers)
		# If it's the last question, change scene even if incorrect (if necessary)
		if current_question == shuffled_messages.size():
			get_tree().change_scene_to_file("res://SCENES/Sub/scam_agree.tscn")
		else:
			current_question += 1  # Proceed to the next question







var shuffled_messages = []

func shuffle_messages():
	# Convert dictionary to an array of key-value pairs
	var message_list = messages.keys()
	message_list.shuffle()  # Shuffle the keys
	
	shuffled_messages.clear()
	for key in message_list:
		shuffled_messages.append(messages[key])
		

func display_name_number():
	# Get the VBoxContainer node
	var vbox = $ScrollContainer/VBoxContainer
	
	# Loop through each child (TextureRect) in the VBoxContainer
	for index in range(vbox.get_child_count()):
		var texture_rect = vbox.get_child(index)
		
		if texture_rect is TextureRect:
			# Find the Label and Label2 for the current TextureRect
			var label = texture_rect.get_node("Label")
			var label2 = texture_rect.get_node("Label2")
			
			if label and label2:
				# Ensure that index is within the shuffled_messages array range
				if index < shuffled_messages.size():
					# Update the label texts based on the tab (TextureRect) index
					label.text = shuffled_messages[index].name
					label2.text = shuffled_messages[index].number
				else:
					print("Error: Invalid index for shuffled_messages: ", index)
			else:
				print("Error: Label or Label2 not found for ", texture_rect.name)



func display_message(index: int):
	$WindowsBorder/QUESTION.text = ""
	current_question = index
	
	if shuffled_messages.is_empty():
		print("Error: shuffled_messages is empty")
		return
	
	# Adjust index here (subtract 1 if necessary)
	var adjusted_index = index - 1
	
	# Check if adjusted index is within valid range
	if adjusted_index < 0 or adjusted_index >= shuffled_messages.size():
		print("Error: Invalid index ", adjusted_index)
		return
	
	# Display message
	$WindowsBorder/QUESTION.text = shuffled_messages[adjusted_index].content
	current_question_real = shuffled_messages[adjusted_index].is_real




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


func _on_scam_pressed() -> void:
	real_report_delete(false)


func _on_real_pressed() -> void:
	real_report_delete(true)
