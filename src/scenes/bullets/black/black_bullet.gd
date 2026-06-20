class_name BlackBullet extends Bullet

const black_bullet_scene: PackedScene = preload("res://scenes/bullets/black/black_bullet.tscn")

const MAX_SPEED: float = 250.0

var direction: Vector2 = Vector2.ZERO

static func create(p_position: Vector2, p_direction: Vector2) -> BlackBullet:
	var black_bullet: BlackBullet = black_bullet_scene.instantiate()
	black_bullet.global_position = p_position
	black_bullet.direction = p_direction
	return black_bullet
	
func _ready() -> void:
	super._ready()
	
func _physics_process(delta: float) -> void:
	translate(MAX_SPEED * direction * delta)
