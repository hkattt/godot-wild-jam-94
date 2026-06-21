class_name MemCard extends Control

@export var game_arena: GameArena

@onready var triangle: TextureRect = $MarginContainer/Content/TopRow/Triangle/Triangle
@onready var diamond: TextureRect = $MarginContainer/Content/TopRow/Diamond/Diamond
@onready var rectangle: TextureRect = $MarginContainer/Content/BottomRow/Rectangle/Rectangle
@onready var star: TextureRect = $MarginContainer/Content/BottomRow/Star/Star

func _ready() -> void:
	var gun: Gun = game_arena.character.get_gun()
	gun.memory_cells_changed.connect(_on_memory_cell_changed)
	toggle_memory_cell_visibility(gun.get_memory_cells())

func toggle_memory_cell_visibility(memory_cells: Array[Enums.MemoryCell]):
	triangle.visible = false
	diamond.visible = false
	rectangle.visible = false
	star.visible = false
	
	for memory_cell in memory_cells:
		match memory_cell:
			Enums.MemoryCell.TRIANGLE:
				triangle.visible = true
			Enums.MemoryCell.DIAMOND:
				diamond.visible = true
			Enums.MemoryCell.RECTANGLE:
				rectangle.visible = true
			Enums.MemoryCell.STAR:
				star.visible = true
			
func _on_memory_cell_changed(memory_cells: Array[Enums.MemoryCell]):
	toggle_memory_cell_visibility(memory_cells)
