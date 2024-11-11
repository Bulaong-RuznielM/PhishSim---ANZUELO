# res://Scripts/global.gd
extends Node

var settings_file_path = "res://Scripts/Data/setting.json"

var power_ups = {
}

# Load the selected language from settings.json
func load_language_from_settings() -> String:
	var file = FileAccess.open(settings_file_path, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		
		var json = JSON.parse_string(json_string)
		if typeof(json) == TYPE_DICTIONARY and json.has("user"):
			var user_data = json["user"]
			if user_data.has("gameplay") and user_data["gameplay"].has("language"):
				return user_data["gameplay"]["language"]
			else:
				print("Error: Could not find 'language' in settings.")
		else:
			print("Error: Could not find 'user' in settings.")
	return "English"
	
# Load the selected language from settings.json
func load_resolution_from_settings() -> String:
	var file = FileAccess.open(settings_file_path, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		
		var json = JSON.parse_string(json_string)
		if typeof(json) == TYPE_DICTIONARY and json.has("user"):
			var user_data = json["user"]
			if user_data.has("display") and user_data["display"].has("resolution"):
				return user_data["display"]["resolution"]
			else:
				print("Error: Could not find 'resolutions' in settings.")
		else:
			print("Error: Could not find 'user' in settings.")
	return "1280x720"
	
	# Load the selected language from settings.json
func load_resolution_scales_from_settings() -> String:
	var file = FileAccess.open(settings_file_path, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		
		var json = JSON.parse_string(json_string)
		if typeof(json) == TYPE_DICTIONARY and json.has("user"):
			var user_data = json["user"]
			if user_data.has("display") and user_data["display"].has("resolutionscal"):
				return user_data["display"]["resolutionscal"]
			else:
				print("Error: Could not find 'resolutionscal' in settings.")
		else:
			print("Error: Could not find 'user' in settings.")
	return "1280x720"
