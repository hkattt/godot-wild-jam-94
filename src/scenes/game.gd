class_name Game extends Node2D

@onready var character: Character = $Character

func _ready() -> void:
	var spawner: Spawner = Spawner.create(character, 5, 1, 5)
	add_child(spawner)
