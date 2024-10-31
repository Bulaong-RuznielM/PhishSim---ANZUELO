extends Control

# Language settings
var languages = [
	"Arabic", "Czech", "Danish", "Dutch", "English", 
	"French", "German", "Italian", "Japanese", "Korean", 
	"Norwegian", "Polish", "Portuguese", "Russian", 
	"Simplified Chinese", "Spanish", "Swedish", 
	"Thai", "Traditional Chinese", "Turkish"
]
var settings_file_path = "res://Scripts/setting.json"

func _ready():
	setup_language_options()

func load_language_from_settings() -> String:
	var file = FileAccess.open(settings_file_path, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		print("JSON file content:", json_string)  # Check the exact JSON content
		file.close()
		
		# Parse JSON directly as a Dictionary
		var json = JSON.parse_string(json_string)
		if typeof(json) == TYPE_DICTIONARY:
			print("Parsing result:", json)  # Show the parsed JSON result
			if json.has("language"):
				print("Found 'language' key:", json["language"])
				return json["language"]
			else:
				print("Key 'language' not found in JSON result.")
		else:
			print("Error parsing JSON or unexpected format.")
	return "English"  # Default to English if there’s an issue


# Setup OptionButton with language options and select saved language
func setup_language_options():
	var option_button = %LanguageSelectionOptionButton
	
	# Add languages to OptionButton
	for language in languages:
		option_button.add_item(language)
	
	# Select the saved language from settings
	var saved_language = load_language_from_settings()
	var language_index = languages.find(saved_language)
	if language_index != -1:
		option_button.select(language_index)

func _on_exit_setting_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Game.tscn")
