class_name StatCard extends Control

@export var game_arena: GameArena

@onready var health_label: Label = $Content/VBoxContainer/Health
@onready var move_speed_label: Label = $"Content/VBoxContainer/Move Speed"
@onready var fps_label: Label = $Content/VBoxContainer/FPS
@onready var current_wave_label: Label = $Content/VBoxContainer/CurrentWave

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	health_label.text = "Health: {health} / {max_health}".format({"health": int(game_arena.character.health.health), "max_health": int(game_arena.character.health.max_health)})
	move_speed_label.text = "Move Speed: {move_speed}".format({"move_speed": game_arena.character.max_speed})
	fps_label.text = "FPS: {fps}".format({"fps": Engine.get_frames_per_second()})
	current_wave_label.text = "Current Wave: {current_wave}".format({"current_wave": game_arena.get_current_wave()})
