extends Node2D

@onready var sound_player: AudioStreamPlayer2D = $SoundPlayer

var click_sound: AudioStream = preload("res://assets/sfx/click.mp3")
var damage_sound: AudioStream = preload("res://assets/sfx/damage.mp3")
var death_sound: AudioStream = preload("res://assets/sfx/death.mp3")

var sounds: Dictionary[Enums.Sound, AudioStream] = {
	Enums.Sound.CLICK: click_sound,
	Enums.Sound.DAMAGE: damage_sound,
	Enums.Sound.DEATH: death_sound
}

func play_sound(sound: Enums.Sound, volume_db: float = 0.0) -> void:
	if sound in sounds:
		var audio_stream: AudioStream = sounds[sound]
		sound_player.stop()
		sound_player.stream = audio_stream
		sound_player.set_volume_db(volume_db)
		sound_player.play()

func _on_sound_player_finished() -> void:
	pass # Replace with function body.
