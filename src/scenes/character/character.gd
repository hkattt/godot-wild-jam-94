class_name Character extends CharacterBody2D

const MAX_SPEED: float = 250.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var gun = $Gun

var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	animated_sprite.play("default")
	
func _physics_process(delta: float) -> void:
	direction = Vector2(
		int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left")), 
		int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	).normalized()
	
	velocity = direction * MAX_SPEED
	move_and_slide()

func get_gun() -> Gun:
	return gun
