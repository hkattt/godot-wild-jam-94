class_name GreenBullet extends Bullet

const green_bullet_scene: PackedScene = preload("res://scenes/bullets/green/green_bullet.tscn")

const MAX_SPEED: float = 300.0

var direction: Vector2 = Vector2.ZERO

static func create(p_position: Vector2, p_direction: Vector2) -> GreenBullet:
	var green_bullet: GreenBullet = green_bullet_scene.instantiate()
	green_bullet.global_position = p_position
	green_bullet.direction = p_direction
	return green_bullet
	
func _ready() -> void:
	super._ready()
	
func _physics_process(delta: float) -> void:
	translate(MAX_SPEED * direction * delta)
