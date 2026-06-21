class_name UpgradeCard extends Control

signal selected(upgrade: Enums.Upgrade)

@onready var title: Label = $TextureButton/MarginContainer/VBoxContainer/Title
@onready var description: Label = $TextureButton/MarginContainer/VBoxContainer/Description
@onready var icon: TextureRect = $TextureButton/MarginContainer/VBoxContainer/Icon

var health_icon: Texture2D = load("res://assets/images/ui/upgrade_card/upgrade-health.png")
var move_speed_icon: Texture2D = load("res://assets/images/ui/upgrade_card/upgrade-move-speed.png")
var memory_cell_icon: Texture2D = load("res://assets/images/ui/upgrade_card/upgrade-mem.png")
var gun_icon: Texture2D = load("res://assets/images/ui/upgrade_card/upgrade-gun.png")

var upgrade: Enums.Upgrade

const UPGRADE_TITLE_MAP: Dictionary[Enums.Upgrade, String] = {
	Enums.Upgrade.CHARACTER_HEAL: "Heal",
	Enums.Upgrade.CHARACTER_HEALTH: "Maximum Health",
	Enums.Upgrade.CHARACTER_MOVE_SPEED: "Move Speed",
	Enums.Upgrade.MEMORY_CELL_DIAMOND: "Diamond Memory Cell",
	Enums.Upgrade.MEMORY_CELL_RECTANGLE: "Rectangle Memory Cell",
	Enums.Upgrade.MEMORY_CELL_STAR: "Star Memory Cell",
	# Enums.Upgrade.GUN_DAMAGE: "Damage", TODO: Implement
	Enums.Upgrade.GUN_BURST: "Burst Spray Pattern",
	Enums.Upgrade.GUN_FIRE_RATE: "Fire Rate"
}

const UPGRADE_DESCRIPTION_MAP: Dictionary[Enums.Upgrade, String] = {
	Enums.Upgrade.CHARACTER_HEAL: "Heal for a small amount.",
	Enums.Upgrade.CHARACTER_HEALTH: "Increase maximum health.",
	Enums.Upgrade.CHARACTER_MOVE_SPEED: "Increase move speed.",
	Enums.Upgrade.MEMORY_CELL_DIAMOND: "Gain the diamond memory cell. Defeat enemies with diamond mutations.",
	Enums.Upgrade.MEMORY_CELL_RECTANGLE: "Gain the rectangle memory cell. Defeat enemies with rectangle mutations.",
	Enums.Upgrade.MEMORY_CELL_STAR: "Gain the star memory cell. Defeat enemies with star mutations.",
	# Enums.Upgrade.GUN_DAMAGE: "Damage", TODO: Implement
	Enums.Upgrade.GUN_BURST: "Switch to burst spray pattern.",
	Enums.Upgrade.GUN_FIRE_RATE: "Increase fire rate."
}

var UPGRADE_ICON_MAP: Dictionary[Enums.Upgrade, Texture2D] = {
	Enums.Upgrade.CHARACTER_HEAL: health_icon,
	Enums.Upgrade.CHARACTER_HEALTH: health_icon,
	Enums.Upgrade.CHARACTER_MOVE_SPEED: move_speed_icon,
	Enums.Upgrade.MEMORY_CELL_DIAMOND: memory_cell_icon,
	Enums.Upgrade.MEMORY_CELL_RECTANGLE: memory_cell_icon,
	Enums.Upgrade.MEMORY_CELL_STAR: memory_cell_icon,
	# Enums.Upgrade.GUN_DAMAGE: "Damage", TODO: Implement
	Enums.Upgrade.GUN_BURST: gun_icon,
	Enums.Upgrade.GUN_FIRE_RATE: gun_icon
}

func set_upgrade(p_upgrade: Enums.Upgrade) -> void:
	upgrade = p_upgrade
	title.text = UPGRADE_TITLE_MAP[upgrade]
	description.text = UPGRADE_DESCRIPTION_MAP[upgrade]
	icon.texture = UPGRADE_ICON_MAP[upgrade]	

func _on_texture_button_pressed() -> void:
	SoundManager.play_sound(Enums.Sound.CLICK, 5.0)
	selected.emit(upgrade)
