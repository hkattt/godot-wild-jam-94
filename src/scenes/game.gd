class_name Game extends Node

@onready var fps_label: Label = $GameUI/HBoxContainer/RightPanel/VBoxContainer/FPS

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	fps_label.text = "FPS: {fps}".format({"fps": Engine.get_frames_per_second()})
