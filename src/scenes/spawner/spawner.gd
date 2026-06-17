class_name Spawner extends Node2D

@export var wave_manager: WaveManager

@onready var timer: Timer = $Timer

const spawner_scene: PackedScene = preload("res://scenes/spawner/spawner.tscn")

# Parameters
var target: Node2D
var number_of_enemies: int
var spawn_time_min: int
var spawn_time_max: int

var enemy_count: int = 0
	
func _ready() -> void:
	wave_manager.start_wave.connect(_on_start_wave)
	wave_manager.end_wave.connect(_on_end_wave)
	randomize()
	
func init(p_target: Node2D, p_number_of_enemies: int, p_spawn_time_min: int, p_spawn_time_max: int) -> void:
	target = p_target
	number_of_enemies = p_number_of_enemies
	spawn_time_min = p_spawn_time_min
	spawn_time_max = p_spawn_time_max
	
func _on_start_wave() -> void:
	var delay = randf_range(spawn_time_min, spawn_time_max)
	timer.start(delay)
	
func _on_end_wave() -> void:
	timer.stop()
	
func _on_timer_timeout() -> void:
	var random_mutations: Array[Enums.Mutation] = []
	var enum_values = Enums.Mutation.values()
	var number_of_mutations: int = randi_range(0, 3)
	for i in range(number_of_mutations):
		var random_index = randi() % enum_values.size()
		var random_mutation = enum_values[randi() % enum_values.size()]
		random_mutations.append(random_mutation)
	
	var rhinovirus: Rhinovirus = Rhinovirus.create(target, position, random_mutations)
	get_parent().add_child(rhinovirus)
	enemy_count += 1
	
	if (enemy_count < number_of_enemies):
		var delay = randf_range(spawn_time_min, spawn_time_max)
		timer.start(delay)
	else:
		timer.stop()
