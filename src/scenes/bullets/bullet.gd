class_name Bullet extends Area2D

func _ready() -> void:
	self.area_exited.connect(_on_area_exited)
	add_to_group("bullets", true)
		
func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("game_boundary"):
		queue_free()
