extends AudioStreamPlayer

var music_tracks = {
	"main_theme": preload("res://Assets/Audio/Groovy Saturday.ogg"),
	# Añade más pistas según sea necesario
}

func play_music(track_name: String):
	if music_tracks.has(track_name):
		if stream != music_tracks[track_name]:
			stream = music_tracks[track_name]
		if not playing:
			play()

func stop_music():
	stop()

func pause_music():
	stream_paused = true

func resume_music():
	stream_paused = false

func set_volume(value: float):
	volume_db = linear_to_db(value)
