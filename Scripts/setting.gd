extends Control

var settings_file_path = "res://Scripts/Data/setting.json"
var language_file_path = "res://Scripts/Data/Language.json"

func _ready():
	setup_all()
	%MasterVolumeHSlider.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	%MusicVolumeHSlider.value = db_to_linear(AudioServer.get_bus_volume_db(1))
	%SoundEffectsVolumeHSlider.value = db_to_linear(AudioServer.get_bus_volume_db(2))

# Function to load resolutions from the file
func load_resolutions_from_file() -> Array:
	var file = FileAccess.open(language_file_path, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		
		var json = JSON.parse_string(json_string)
		if typeof(json) == TYPE_DICTIONARY and json.has("Resolution"):  # Checking one main key to confirm structure
			return json["Resolution"]
		else:
			print("Error: Resolution data missing or unexpected format.")
	return []

# Function to load resolution scales from the file
func load_resolution_scales_from_file() -> Array:
	var file = FileAccess.open(language_file_path, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		
		var json = JSON.parse_string(json_string)
		if typeof(json) == TYPE_DICTIONARY and json.has("ResolutionScal"):  # Checking one main key to confirm structure
			return json["ResolutionScal"]
		else:
			print("Error: Resolution scale data missing or unexpected format.")
	return []

func load_languages_from_file() -> Array:
	var file = FileAccess.open(language_file_path, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		
		var json = JSON.parse_string(json_string)
		if typeof(json) == TYPE_DICTIONARY and json.has(Global.load_language_from_settings()):  # Checking one main key to confirm structure
			return json[Global.load_language_from_settings()]["setting"]["gameplay"]["languages"]
		else:
			print("Error: Language data missing or unexpected format.")
	return []

# Setup OptionButton with language options and select saved language
func setup_language_options():
	var option_button = %LanguageSelectionOptionButton
	
	var languages = load_languages_from_file()
	for language in languages:
		option_button.add_item(language)
	
	var saved_language = Global.load_language_from_settings()
	var language_index = languages.find(saved_language)
	if language_index != -1:
		option_button.select(language_index)
		
func setup_resolution_option():
	var option_button = %ResolutionOptionButton
	
	var resolutions =  load_resolutions_from_file()
	for resolution in resolutions:
		option_button.add_item(resolution)
	
	var saved_resolutions = Global.load_resolution_from_settings()
	var resolutions_index = resolutions.find(saved_resolutions)
	if resolutions_index != -1:
		option_button.select(saved_resolutions)

func setup_resolution_scales_option():
	var option_button = %ResolutionScalingOptionButton
	
	var resolutionscals =  load_resolution_scales_from_file()
	for resolutionscal in resolutionscals:
		option_button.add_item(resolutionscal)
		
	var saved_resolutionscals = Global.load_resolution_scales_from_settings()
	var resolutionscals_index = resolutionscals.find(saved_resolutionscals)
	if resolutionscals_index != -1:
		option_button.select(saved_resolutionscals)
		
func setup_all():
	setup_language_options()
	#setup_resolution_option()
	#setup_resolution_scales_option()

func _on_exit_setting_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/Game.tscn")

func _on_master_volume_h_slider_mouse_exited() -> void:
	release_focus()

func _on_music_volume_h_slider_mouse_exited() -> void:
	release_focus()

func _on_sound_effects_volume_h_slider_mouse_exited() -> void:
	release_focus()
