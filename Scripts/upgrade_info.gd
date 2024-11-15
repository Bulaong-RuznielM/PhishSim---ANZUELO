extends Control

@onready var upgradeinfo = $UpgradeInfo
@onready var upgradeheadline = $Upgrade_Info_Headline
@onready var upgradedescription = $Upgrade_Info_Description

var language_path = "res://Scripts/Data/Language.json"

func _ready() -> void:
	pass

func read_headline_description_per_card_json(card):
	var file = FileAccess.open(language_path, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		
		var json = JSON.parse_string(json_string)
		if typeof(json) == TYPE_DICTIONARY and json.has("English"): 
			var language_data = json[Global.load_language_from_settings()]
			if language_data.has("upgrade") and language_data["upgrade"].has(card):
				return language_data["upgrade"][card]
			else:
				print("Error: 'upgrade' data missing or unexpected format.")
		else:
			print("Error: Resolution data missing or unexpected format.")
	return []

func change_headline_description_per_card(card):
	# Read the JSON data for the given card, which is expected to be a Dictionary
	var card_info = read_headline_description_per_card_json(card)
	
	# Check if `card_info` is a Dictionary and contains the expected keys
	if card_info is Dictionary and card_info.has("headline") and card_info.has("description"):
		# Update the headline and description
		change_headline(card_info["headline"])
		change_description(card_info["description"])
	else:
		print("Warning: Missing 'headline' or 'description' for card ", card)


func change_headline(headline):
	upgradeheadline.text = headline

func change_description(description):
	upgradedescription.text = description

func _on_upgrade_1_mouse_entered() -> void:
	change_headline_description_per_card("card0")

func _on_upgrade_2_mouse_entered() -> void:
	change_headline_description_per_card("card1")


func _on_upgrade_3_mouse_entered() -> void:
	change_headline_description_per_card("card2")


func _on_upgrade_4_mouse_entered() -> void:
	change_headline_description_per_card("card3")


func _on_upgrade_5_mouse_entered() -> void:
	change_headline_description_per_card("card4")


func _on_upgrade_6_mouse_entered() -> void:
	change_headline_description_per_card("card5")


func _on_upgrade_7_mouse_entered() -> void:
	change_headline_description_per_card("card6")


func _on_upgrade_8_mouse_entered() -> void:
	change_headline_description_per_card("card7")


func _on_upgrade_9_mouse_entered() -> void:
	change_headline_description_per_card("card8")


func _on_upgrade_10_mouse_entered() -> void:
	change_headline_description_per_card("card9")
