class_name StarBullet extends Bullet

const star_bullet_scene: PackedScene = preload("res://scenes/bullets/star/star_bullet.tscn")

const MAX_SPEED: float = 250.0

var direction: Vector2 = Vector2.ZERO

static func create(p_position: Vector2, p_direction: Vector2) -> StarBullet:
	var star_bullet: StarBullet = star_bullet_scene.instantiate()
	star_bullet.global_position = p_position
	star_bullet.direction = p_direction
	return star_bullet
	
func _ready() -> void:
	super._ready()
	
func _physics_process(delta: float) -> void:
	translate(MAX_SPEED * direction * delta)
