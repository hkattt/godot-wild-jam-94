class_name Enemy extends CharacterBody2D

signal died

@onready var hit_box: HitBox = $HitBox
@onready var health: Health = $Health
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var mutations_balls: MutationBalls = $UI/MutationBalls

var target
var mutations: Array[Enums.Mutation]

func _ready() -> void:
	hit_box.damage_taken.connect(_on_hit_box_damage_taken)
	health.health_depleted.connect(_on_health_health_depleted)
	mutations_balls.init_mutations(mutations)
	animated_sprite.play("default")

func _on_hit_box_damage_taken(damage_source: Enums.DamageSource) -> void:
	if mutations.size() == 0:
		health.take_damage(50)
	
	var target_mutation: Enums.Mutation = Maps.DAMAGE_MUTATION_MAP[damage_source]
	var target_index: int = mutations.find(target_mutation)

	if target_index != -1:
		mutations.remove_at(target_index)
		mutations_balls.remove_mutation(target_mutation)

func _on_health_health_depleted() -> void:
	died.emit()
	queue_free()
