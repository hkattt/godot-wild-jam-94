class_name HitBox extends Area2D

signal damage_taken(damage_source: Enums.DamageSource)

@export var box_size: Vector2

@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	add_to_group("hit_boxes", true)
	collision_shape.shape.size = box_size

func handle_damage_event(damage_source: Enums.DamageSource):
	damage_taken.emit(damage_source)
