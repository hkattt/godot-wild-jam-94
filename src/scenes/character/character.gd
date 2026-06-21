class_name Character extends CharacterBody2D

signal died

var max_speed: float = 250.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var health: Health = $Health
@onready var hit_box: HitBox = $HitBox
@onready var gun = $Gun

var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	hit_box.damage_taken.connect(_on_hit_box_damage_taken)
	health.health_depleted.connect(_on_health_depleted)
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

func _on_health_depleted() -> void:
	died.emit()

func _on_hit_box_damage_taken(damage_source: Enums.DamageSource) -> void:
	match damage_source:
		Enums.DamageSource.VIRUS_1:
			health.take_damage(2.5)
		Enums.DamageSource.VIRUS_2:
			health.take_damage(5)
		Enums.DamageSource.VIRUS_3:
			health.take_damage(10)
		Enums.DamageSource.VIRUS_4:
			health.take_damage(12.5)
