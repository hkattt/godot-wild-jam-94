class_name DiamondBullet extends Bullet

const diamond_bullet_scene: PackedScene = preload("res://scenes/bullets/diamond/diamond_bullet.tscn")

const MAX_SPEED: float = 100.0

var direction: Vector2 = Vector2.ZERO

static func create(p_position: Vector2, p_direction: Vector2) -> DiamondBullet:
	var diamond_bullet: DiamondBullet = diamond_bullet_scene.instantiate()
	diamond_bullet.global_position = p_position
	diamond_bullet.direction = p_direction
	return diamond_bullet
	
func _ready() -> void:
	super._ready()
	
func _physics_process(delta: float) -> void:
	translate(MAX_SPEED * direction * delta)
