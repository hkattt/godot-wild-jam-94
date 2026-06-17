class_name GameArena extends Node2D

@onready var character: Character = $Character
@onready var wave_manager: WaveManager = $WaveManager

func _ready() -> void:
	wave_manager.init()
	wave_manager.start_next_wave()
