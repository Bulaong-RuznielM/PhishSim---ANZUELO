extends Control

@onready var video_player = $intro_VideoStreamPlayer

func _ready():
	# Wait for 1 second before playing the video
	await _wait(1.0)
	video_player.play()

func _on_intro_video_stream_player_finished() -> void:
	# Wait for 1 second after the video finishes
	await _wait(1.0)
	call_deferred("_change_to_menu_scene")

# Helper function to create a delay
func _wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func _change_to_menu_scene():
	get_tree().change_scene_to_file("res://SCENES/Main/menu.tscn")
