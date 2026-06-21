class_name Game extends Node

@onready var game_arena: GameArena = $GameArena
@onready var upgrade_menu: UpgradeMenu = $UpgradeMenu
@onready var centre_panel: VBoxContainer = $GameUI/HBoxContainer/CentrePanel/VBoxContainer

func _ready() -> void:
	game_arena.game_over.connect(_on_game_over)
	game_arena.wave_complete.connect(_on_wave_complete)
	upgrade_menu.close_menu.connect(_on_close_menu)

func _on_wave_complete() -> void:
	upgrade_menu.open()

func _on_close_menu(_upgrade: Enums.Upgrade) -> void:
	game_arena.start()

func _on_start_pressed() -> void:
	centre_panel.hide()
	game_arena.start()

func _on_game_over() -> void:
	call_deferred("reload_game")
	
func reload_game() -> void:
	get_tree().reload_current_scene()
