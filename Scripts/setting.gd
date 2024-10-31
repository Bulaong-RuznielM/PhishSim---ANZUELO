extends Control

var settings_file_path = "res://Scripts/setting.json"
var language_file_path = "res://Scripts/Language.json"

func _ready():
	setup_language_options()

func load_resolution_from_file() -> Array:
	var file = FileAccess.open(language_file_path, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		
		var json = JSON.parse_string(json_string)
		if typeof(json) == TYPE_DICTIONARY:
			if json.has("Resolution"):
				return json["Resolution"]
			else:
				print("Error: 'Resolution' key not found in JSON.")
		else:
			print("Error: Unexpected JSON format.")
	return []

func load_resolutionscal_from_file() -> Array:
	var file = FileAccess.open(language_file_path, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		
		var json = JSON.parse_string(json_string)
		if typeof(json) == TYPE_DICTIONARY:
			if json.has("ResolutionScal"):
				return json["ResolutionScal"]
			else:
				print("Error: 'ResolutionScal' key not found in JSON.")
		else:
			print("Error: Unexpected JSON format.")
	return []

# Load and parse the language options from Language.json
func load_languages_from_file() -> Array:
	var file = FileAccess.open(language_file_path, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		
		var json = JSON.parse_string(json_string)
		if typeof(json) == TYPE_DICTIONARY and json.has("English"):  # Checking one main key to confirm structure
			return json["English"]["setting"]["gameplay"]["languages"]
		else:
			print("Error: Language data missing or unexpected format.")
	return []

# Load the selected language from settings.json
func load_language_from_settings() -> String:
	var file = FileAccess.open(settings_file_path, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		
		var json = JSON.parse_string(json_string)
		if typeof(json) == TYPE_DICTIONARY and json.has("language"):
			return json["language"]
		else:
			print("Error: Could not find 'language' in settings.")
	return "English"

# Setup OptionButton with language options and select saved language
func setup_language_options():
	var option_button = %LanguageSelectionOptionButton
	
	var languages = load_languages_from_file()
	for language in languages:
		option_button.add_item(language)
	
	var saved_language = load_language_from_settings()
	var language_index = languages.find(saved_language)
	if language_index != -1:
		option_button.select(language_index)

func _on_exit_setting_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/Game.tscn")
