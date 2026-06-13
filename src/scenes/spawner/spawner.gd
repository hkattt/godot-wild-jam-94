class_name Spawner extends Node2D

@onready var timer: Timer = $Timer

const spawner_scene: PackedScene = preload("res://scenes/spawner/spawner.tscn")

# Parameters
var target: Node2D
var number_of_enemies: int
var spawn_time_min: int
var spawn_time_max: int

var enemy_count: int = 0

static func create(p_target: Node2D, p_number_of_enemies: int, p_spawn_time_min: int, p_spawn_time_max: int) -> Spawner:
	var spawner: Spawner = spawner_scene.instantiate()
	spawner.target = p_target
	spawner.number_of_enemies = p_number_of_enemies
	spawner.spawn_time_min = p_spawn_time_min
	spawner.spawn_time_max = p_spawn_time_max
	
	return spawner
	
func _ready() -> void:
	randomize()
	
func _on_timer_timeout() -> void:
	var vampire: Vampire = Vampire.create(target, Vector2(100, 100))
	get_parent().add_child(vampire)
	enemy_count += 1
	if (enemy_count < number_of_enemies):
		var delay = randf_range(spawn_time_min, spawn_time_max)
		timer.start(delay)
	else:
		timer.stop()
