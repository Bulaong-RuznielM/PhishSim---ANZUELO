extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioPlayer.play_music_gamee()


# Called every frame. 'delis the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
