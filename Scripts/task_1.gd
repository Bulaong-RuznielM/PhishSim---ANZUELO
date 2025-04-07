extends Node2D

var second_finish: int = 20
var second_game_time: int = 0
var ads_limit = 6

func spawn_popup() -> void:
	Global.ads += 1
	$TimerGameSecond.wait_time -= 0.0081
	
	# List of available ads scenes
	var ads_list = [
		# preload("res://SCENES/Sub/game_task_list/GAME_TASK 1/task1_ads_list/ads1.tscn"),
		preload("res://SCENES/Sub/game_task_list/GAME_TASK 1/task1_ads_list/ads2.tscn"),
		preload("res://SCENES/Sub/game_task_list/GAME_TASK 1/task1_ads_list/ads3.tscn"),
		preload("res://SCENES/Sub/game_task_list/GAME_TASK 1/task1_ads_list/ads4.tscn"),
		preload("res://SCENES/Sub/game_task_list/GAME_TASK 1/task1_ads_list/ads5.tscn"),
		preload("res://SCENES/Sub/game_task_list/GAME_TASK 1/task1_ads_list/ads6.tscn"),
		preload("res://SCENES/Sub/game_task_list/GAME_TASK 1/task1_ads_list/ads7.tscn"),
		preload("res://SCENES/Sub/game_task_list/GAME_TASK 1/task1_ads_list/ads8.tscn")
	]
	
	# Randomly pick an ad scene from the list
	var random_ad_scene = ads_list[randi() % ads_list.size()]
	
	# Instantiate and position the ad popup
	var new_popup = random_ad_scene.instantiate()
	%PopUpSpawnLocation.progress_ratio = randf()
	new_popup.global_position = %PopUpSpawnLocation.global_position
	add_child(new_popup)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/Task.tscn")
	Global.ads = 0

func if_ads_more_than(max_ads: int) -> void:
	if Global.ads >= max_ads:
		spawn_popup()

func is_lose(max_ads: int) -> bool:
	return Global.ads >= (max_ads)

func _on_timer_main_timeout() -> void:
	spawn_popup()
	if_ads_more_than(ads_limit)

func _on_timer_ads_counter_timeout() -> void:
	$ADNumber.text = "No. of ADS: " + str(Global.ads)
	$TimeLeft.text = "Time Left: " + str(second_finish - second_game_time)

func _on_timer_game_second_timeout() -> void:
	second_game_time += 1
	if second_game_time >= second_finish:
		if is_lose(ads_limit):
			get_tree().change_scene_to_file("res://SCENES/Sub/scam_agree.tscn") # Lose condition
		else:
			get_tree().change_scene_to_file("res://SCENES/Sub/scam_report.tscn") # Win condition
			
		Global.ads = 0
