class_name Gun extends Node2D

signal memory_cells_changed(memory_cells: Array[Enums.MemoryCell])

@onready var timer: Timer = $Timer

var memory_cells: Array[Enums.MemoryCell] = [Enums.MemoryCell.TRIANGLE]
var spray_patten: Enums.BulletPattern = Enums.BulletPattern.SINGLE
var current_memory_cell_idx: int = 0
var fire_delay: float = 1.0

func _ready() -> void:
	timer.start(fire_delay)
	
func _input(event):
	if event.is_action_pressed("swap_memory_cell_left"):
		current_memory_cell_idx = (current_memory_cell_idx + 1) % memory_cells.size()
	if event.is_action_pressed("swap_memory_cell_right"):
		current_memory_cell_idx = (current_memory_cell_idx - 1) % memory_cells.size()

func get_memory_cells() -> Array[Enums.MemoryCell]:
	return memory_cells
	
func add_memory_cell(memory_cell: Enums.MemoryCell) -> void:
	memory_cells.append(memory_cell)
	memory_cells_changed.emit(memory_cells)

func increase_fire_rate(delta: float) -> void:
	fire_delay = max(0.1, fire_delay - delta)

func set_spray_pattern(new_spray_pattern: Enums.BulletPattern):
	spray_patten = new_spray_pattern

func create_bullet(memory_cell: Enums.MemoryCell, bullet_position: Vector2, direction: Vector2) -> Bullet:
	var spawn_position: Vector2 = bullet_position + 50 * direction
	match memory_cell:
		Enums.MemoryCell.TRIANGLE:
			return TriangleBullet.create(spawn_position, direction)
		Enums.MemoryCell.DIAMOND:
			return DiamondBullet.create(spawn_position, direction)
		Enums.MemoryCell.RECTANGLE:
			return RectangleBullet.create(spawn_position, direction)
		Enums.MemoryCell.STAR:
			return StarBullet.create(spawn_position, direction)
		_:
			return
	
func fire(memory_cell: Enums.MemoryCell, pattern: Enums.BulletPattern) -> void:
	var direction: Vector2 = (get_global_mouse_position() - global_position).normalized()
	
	var character := get_parent() as Character
	if character.animated_sprite:
		character.animated_sprite.play("shoot")
	
	match pattern:
		Enums.BulletPattern.SINGLE:
			var bullet: Bullet = create_bullet(memory_cell, global_position, direction)
			get_tree().current_scene.add_child.call_deferred(bullet)			

		Enums.BulletPattern.BURST:
			var delay: float = 0.1
			var num_bullets: int = 4
			for i in range(num_bullets):
				var bullet: Bullet = create_bullet(memory_cell, global_position, direction)
				get_tree().current_scene.add_child.call_deferred(bullet)
				
				if i < num_bullets -1:
					await get_tree().create_timer(delay).timeout

func _on_timer_timeout() -> void:
	var current_memory_cell = memory_cells[current_memory_cell_idx]
	fire(current_memory_cell, spray_patten)
	timer.start(fire_delay)
