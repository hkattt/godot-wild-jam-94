class_name GameArena extends Node2D

signal game_over
signal wave_complete

@onready var character: Character = $Character
@onready var wave_manager: WaveManager = $WaveManager

func _ready() -> void:
	character.died.connect(_on_character_died)
	wave_manager.end_wave.connect(_on_end_wave)

func start():
	var gun: Gun = character.get_gun()
	var memory_cells: Array[Enums.MemoryCell] = gun.get_memory_cells()
	var available_mutations: Array[Enums.Mutation] = []
	
	for memory_cell in memory_cells:
		available_mutations.append(Maps.MEMORY_CELL_MUTATION_MAP[memory_cell])
		
	wave_manager.init(available_mutations)
	wave_manager.start_next_wave()

func get_current_wave() -> int:
	return wave_manager.get_current_wave()

func _on_end_wave() -> void:
	wave_complete.emit()
	
func _on_character_died() -> void:
	game_over.emit()
