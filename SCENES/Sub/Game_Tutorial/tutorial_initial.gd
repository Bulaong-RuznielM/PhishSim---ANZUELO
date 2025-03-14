extends Node2D


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Sub/Game_Tutorial/Tutorial_UPGRADES.tscn")
