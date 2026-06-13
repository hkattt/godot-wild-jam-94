class_name WhiteBullet extends Bullet

const white_bullet_scene: PackedScene = preload("res://scenes/bullets/white/white_bullet.tscn")

const MAX_SPEED: float = 250.0

var direction: Vector2 = Vector2.ZERO

static func create(p_position: Vector2, p_direction: Vector2) -> WhiteBullet:
	var white_bullet: WhiteBullet = white_bullet_scene.instantiate()
	white_bullet.global_position = p_position
	white_bullet.direction = p_direction
	return white_bullet
	
func _ready() -> void:
	super._ready()
	
func _physics_process(delta: float) -> void:
	translate(MAX_SPEED * direction * delta)
