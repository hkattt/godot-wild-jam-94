class_name Character extends CharacterBody2D

var max_speed: float = 250.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var health: Health = $Health
@onready var gun = $Gun

var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	animated_sprite.play("default")
	
func _physics_process(_delta: float) -> void:
	direction = Vector2(
		int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left")), 
		int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	).normalized()
	
	velocity = direction * max_speed
	move_and_slide()

func increase_speed(speed: float) -> void:
	max_speed += speed
		
func increase_max_health(delta: float) -> void:
	health.increase_max_health(delta)
	
func heal(delta: float) -> void:
	health.heal(delta)

func get_gun() -> Gun:
	return gun
