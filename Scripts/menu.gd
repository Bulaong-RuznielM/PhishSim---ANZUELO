extends Control


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Main/Game.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_main_menu_music_finished() -> void:
	$MainMenuMusic.play()
