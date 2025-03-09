extends Node2D

func spawn_popup():
	Global.ads +=1
	var new_popup = preload("res://SCENES/Sub/phishing_popup.tscn").instantiate()
	%PopUpSpawnLocation.progress_ratio = randf()
	new_popup.global_position = %PopUpSpawnLocation.global_position
	add_child(new_popup)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/task.tscn")
	Global.ads = 0

func ifAdsMoreThan(maxAds):
	if (Global.ads >= maxAds):
		spawn_popup()

func isLose(maxAds):
	if (Global.ads >= (maxAds + maxAds)):
		pass

func _on_timer_main_timeout() -> void:
	spawn_popup()
	ifAdsMoreThan(20)

func _on_timer_ads_counter_timeout() -> void:
	$ADNumber.text = "No. of ADS: " + str(Global.ads)
