class_name StatCard extends Control

@export var game_arena: GameArena

@onready var fps_label: Label = $Content/VBoxContainer/FPS
@onready var current_wave_label: Label = $Content/VBoxContainer/CurrentWave

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	fps_label.text = "FPS: {fps}".format({"fps": Engine.get_frames_per_second()})
	current_wave_label.text = "Current Wave: {current_wave}".format({"current_wave": game_arena.get_current_wave()})
