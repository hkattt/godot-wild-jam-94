class_name Character extends CharacterBody2D

const MAX_SPEED: float = 150.0
const ACCELERATION: float = 300.0

var direction: Vector2 = Vector2.ZERO
var current_velocity: Vector2 = Vector2.ZERO
var target_velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	direction = Vector2(
		int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left")), 
		int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	).normalized()
	
	if (direction.length() == 0):
		target_velocity = Vector2.ZERO
	else:
		target_velocity = MAX_SPEED * direction
		
	current_velocity =current_velocity.move_toward(target_velocity, ACCELERATION * delta)
	
	velocity = current_velocity
	move_and_slide()
