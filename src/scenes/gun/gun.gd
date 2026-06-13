class_name Gun extends Node2D

var memory_cells: Array[Enums.MemoryCell] = [
	Enums.MemoryCell.WHITE, 
	Enums.MemoryCell.RED,
	Enums.MemoryCell.GREEN
]

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

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		var direction: Vector2 = (get_global_mouse_position() - global_position).normalized()
		
		for memory_cell in memory_cells:
			var bullet: Bullet = create_bullet(memory_cell, global_position, direction)
			get_tree().current_scene.add_child(bullet)
