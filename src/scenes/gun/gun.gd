class_name Gun extends Node2D

var memory_cells: Array[Enums.MemoryCell] = [Enums.MemoryCell.WHITE]

var current_memory_cell_idx := 0

var guns: Array[Enums.BulletPattern] = [
	Enums.BulletPattern.SINGLE,
	Enums.BulletPattern.BURST
]

var current_gun_idx := 0

func _ready() -> void:
	start_firing()

func _input(event):
	if event.is_action_pressed("swap_gun_left"):
		current_memory_cell_idx = (current_memory_cell_idx + 1) % memory_cells.size()
	if event.is_action_pressed("swap_gun_right"):
		current_memory_cell_idx = (current_memory_cell_idx - 1) % memory_cells.size()
	if event.is_action_pressed("swap_gun"):
		current_gun_idx = (current_memory_cell_idx + 1) % memory_cells.size()

func get_memory_cells() -> Array[Enums.MemoryCell]:
	return memory_cells
	
func add_memory_cell(memory_cell: Enums.MemoryCell) -> void:
	memory_cells.append(memory_cell)

func create_bullet(memory_cell: Enums.MemoryCell, bullet_position: Vector2, direction: Vector2) -> Bullet:
	match memory_cell:
		Enums.MemoryCell.WHITE:
			return WhiteBullet.create(bullet_position, direction)
		Enums.MemoryCell.RED:
			return RedBullet.create(bullet_position, direction)
		Enums.MemoryCell.GREEN:
			return GreenBullet.create(bullet_position, direction)
		_:
			return
	
func fire(memory_cell, pattern, num_bullets, delay) -> void:
	var direction: Vector2 = (get_global_mouse_position() - global_position).normalized()
	match pattern:
		Enums.BulletPattern.SINGLE:
			var bullet: Bullet = create_bullet(memory_cell, global_position, direction)
			get_tree().current_scene.add_child.call_deferred(bullet)

		Enums.BulletPattern.BURST:
			for i in range(num_bullets):
				var bullet: Bullet = create_bullet(memory_cell, global_position, direction)
				get_tree().current_scene.add_child.call_deferred(bullet)
				
				if i < num_bullets -1:
					await get_tree().create_timer(delay).timeout

func start_firing() -> void:
	while true:
		var current_memory_cell = memory_cells[current_memory_cell_idx]
		var current_gun = guns[current_gun_idx]
		fire(current_memory_cell, current_gun, 4, 0.1)
		await get_tree().create_timer(0.7).timeout
