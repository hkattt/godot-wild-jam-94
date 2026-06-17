class_name Health extends Node2D

signal health_depleted
signal took_damage

@export var health: float

var max_health: float

func _ready() -> void:
	max_health = health	

func take_damage(damage: float):
	health = max(health - damage, 0.0)
		
	took_damage.emit()	

	if health == 0.0:
		health_depleted.emit()
