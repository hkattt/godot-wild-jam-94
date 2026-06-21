class_name TriangleBullet extends Bullet

const triangle_bullet_scene: PackedScene = preload("res://scenes/bullets/triangle/triangle_bullet.tscn")

const MAX_SPEED: float = 250.0

var direction: Vector2 = Vector2.ZERO

static func create(p_position: Vector2, p_direction: Vector2) -> TriangleBullet:
	var triangle_bullet: TriangleBullet = triangle_bullet_scene.instantiate()
	triangle_bullet.global_position = p_position
	triangle_bullet.direction = p_direction
	return triangle_bullet
	
func _ready() -> void:
	super._ready()
	
func _physics_process(delta: float) -> void:
	translate(MAX_SPEED * direction * delta)
