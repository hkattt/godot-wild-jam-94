class_name RedBullet extends Bullet

const red_bullet_scene: PackedScene = preload("res://scenes/bullets/red/red_bullet.tscn")

const MAX_SPEED: float = 100.0

var direction: Vector2 = Vector2.ZERO

static func create(p_position: Vector2, p_direction: Vector2) -> RedBullet:
	var red_bullet: RedBullet = red_bullet_scene.instantiate()
	red_bullet.global_position = p_position
	red_bullet.direction = p_direction
	return red_bullet
	
func _ready() -> void:
	super._ready()
	
func _physics_process(delta: float) -> void:
	translate(MAX_SPEED * direction * delta)
