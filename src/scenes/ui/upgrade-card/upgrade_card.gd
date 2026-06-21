class_name UpgradeCard extends Control

signal selected

func _on_texture_button_pressed() -> void:
	selected.emit()
