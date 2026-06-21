extends Node2D

@onready var music_player: AudioStreamPlayer2D = $MusicPlayer

var action_music: AudioStream = preload("res://assets/music/action-music.mp3")

var musics: Dictionary[Enums.Music, AudioStream] = {
	Enums.Music.ACTION: action_music
}

func play_music(music: Enums.Music, volume_db: float = 0.0) -> void:
	if music in musics:
		var audio_stream: AudioStream = musics[music]
		if music_player.stream == audio_stream:
			return
		else:
			music_player.stop()
			music_player.stream = audio_stream
			music_player.set_volume_db(volume_db)
			music_player.play()

func _on_music_player_finished() -> void:
	music_player.play()
