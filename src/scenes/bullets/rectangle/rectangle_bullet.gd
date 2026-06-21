class_name RectangleBullet extends Bullet

const rectangle_bullet_scene: PackedScene = preload("res://scenes/bullets/rectangle/rectangle_bullet.tscn")

const MAX_SPEED: float = 300.0

var direction: Vector2 = Vector2.ZERO

static func create(p_position: Vector2, p_direction: Vector2) -> RectangleBullet:
	var rectangle_bullet: RectangleBullet = rectangle_bullet_scene.instantiate()
	rectangle_bullet.global_position = p_position
	rectangle_bullet.direction = p_direction
	return rectangle_bullet
	
func _ready() -> void:
	super._ready()
	
func _physics_process(delta: float) -> void:
	translate(MAX_SPEED * direction * delta)
