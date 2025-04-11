extends Control

func _ready() -> void:
	Global.reset_var()

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/Game.tscn")
