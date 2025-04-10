extends AudioStreamPlayer


const gamee_music = preload("res://AUDIO/phishing_g__Apr_8_2025_821_PM.mp3")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	stream = music
	bus = "Music"
	volume_db = volume
	play()

func play_music_gamee():
	_play_music(gamee_music)
