extends Control

@onready var video_player = $intro_VideoStreamPlayer

func _ready():
	# Use load() instead of preload to handle dynamic paths
	var video_path = "res://ASSETS/CutScenes/intro/0406-copy.ogv"
	
	# Load the video stream directly and assign it to the video stream player
	var video_resource = load(video_path) as VideoStream
	video_player.stream = video_resource
	
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
