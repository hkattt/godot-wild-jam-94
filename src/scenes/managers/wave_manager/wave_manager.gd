class_name WaveManager extends Node2D

signal start_wave
signal end_wave

@export var target: Node2D
@export var spawners: Array[Spawner]

@onready var timer: Timer = $Timer

# wave manager
	# givesn stuff to the spawners
	# determine length of waves
	# determine how many spawners to use
	# send signal on wave end
	# increase the number of enemies, enemy types, and mutations gradually
	# spawner
		# set number of enemies
		# number of enemies
		# available mutations
		# spawn min time and max time
		# create enemies at current location
		
# wave manager needs a way to update spawner properties on the fly

const WAVE_DURATION: int = 30

var current_wave: int = 0

func _ready() -> void:
	pass
	
func init() -> void:
	var number_of_enemies: int = 2
	var spawn_time_min: int = 1
	var spawn_time_max: int = 5
	
	for spawner in spawners:
		spawner.init(target, number_of_enemies, spawn_time_min, spawn_time_max)
		
func start_next_wave() -> void:
	start_wave.emit()
	timer.start(WAVE_DURATION)
		
func _on_timer_timeout() -> void:
	end_wave.emit()
	timer.stop()
