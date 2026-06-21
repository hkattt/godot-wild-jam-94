class_name Spawner extends Node2D

signal wave_complete

@export var wave_manager: WaveManager

@onready var timer: Timer = $Timer

const spawner_scene: PackedScene = preload("res://scenes/spawner/spawner.tscn")

# Parameters
var target: Node2D
var max_enemies: int
var min_spawn_time: float
var max_spawn_time: float
var available_mutations: Array[Enums.Mutation]
var max_enemy_mutations: int

var enemy_count: int = 0
var enemies_alive: int = 0
	
func _ready() -> void:
	wave_manager.start_wave.connect(_on_start_wave)
	wave_manager.end_wave.connect(_on_end_wave)
	randomize()
	
func init(
		p_target: Node2D, 
		p_max_enemies: int, 
		p_min_spawn_time: float, 
		p_max_spawn_time: float, 
		p_available_mutations: Array[Enums.Mutation], 
		p_max_enemy_mutations: int) -> void:
	target = p_target
	max_enemies = p_max_enemies
	enemies_alive = p_max_enemies
	min_spawn_time = p_min_spawn_time
	max_spawn_time = p_max_spawn_time
	available_mutations = p_available_mutations
	max_enemy_mutations = p_max_enemy_mutations

func is_running() -> bool:
	return !timer.is_stopped() or enemies_alive > 0
	
func _on_start_wave() -> void:
	var delay = randf_range(min_spawn_time, max_spawn_time)
	timer.start(delay)
	
func _on_end_wave() -> void:
	timer.stop()
	
func _on_timer_timeout() -> void:
	var random_mutations: Array[Enums.Mutation] = []
	var number_of_mutations = randi_range(0, max_enemy_mutations)
	for i in range(number_of_mutations):
		var random_index = randi() % available_mutations.size()
		var random_mutation = available_mutations[random_index]
		random_mutations.append(random_mutation)
		
	var rand: float = randf_range(0, _calculate_available_viruses(wave_manager.get_current_wave()))
	
	if rand < 0.4:
		var virus1: Virus1 = Virus1.create(target, position, random_mutations)
		virus1.died.connect(_on_enemy_died)
		get_parent().add_child(virus1)
	elif rand < 0.7:
		var virus2: Virus2 = Virus2.create(target, position, random_mutations)
		virus2.died.connect(_on_enemy_died)
		get_parent().add_child(virus2)
	elif rand < 0.9:
		var virus3: Virus3 = Virus3.create(target, position, random_mutations)
		virus3.died.connect(_on_enemy_died)
		get_parent().add_child(virus3)
	else:
		var virus4: Virus4 = Virus4.create(target, position, random_mutations)
		virus4.died.connect(_on_enemy_died)
		get_parent().add_child(virus4)
	
	enemy_count += 1
	
	if (enemy_count < max_enemies):
		var delay = randf_range(min_spawn_time, max_spawn_time)
		timer.start(delay)
	else:
		enemy_count = 0
		timer.stop()

func _calculate_available_viruses(current_wave: int) -> float:
	if current_wave < 2:
		return 0.4
	elif current_wave < 5:
		return 0.7
	elif current_wave < 10:
		return 0.9
	else: 
		return 1.0

func _on_enemy_died() -> void:
	enemies_alive -= 1
	if enemies_alive == 0:
		wave_complete.emit()
