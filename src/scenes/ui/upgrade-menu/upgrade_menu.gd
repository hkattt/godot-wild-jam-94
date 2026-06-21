class_name UpgradeMenu extends Control

signal close_menu

@onready var upgrade_card_left: UpgradeCard = $MarginContainer/VBoxContainer/HBoxContainer/UpgradeCardLeft
@onready var upgrade_card_centre: UpgradeCard = $MarginContainer/VBoxContainer/HBoxContainer/UpgradeCardCentre
@onready var upgrade_card_right: UpgradeCard = $MarginContainer/VBoxContainer/HBoxContainer/UpgradeCardRight

func _ready() -> void:
	upgrade_card_left.selected.connect(_on_card_selected)
	upgrade_card_centre.selected.connect(_on_card_selected)
	upgrade_card_right.selected.connect(_on_card_selected)

func _on_card_selected() -> void:
	visible = false
	close_menu.emit()
