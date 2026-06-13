class_name Bullet extends Area2D

var body: Area2D

func _ready() -> void:
	self.area_exited.connect(_on_area_exited)
		
func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("game_boundary"):
		queue_free()
