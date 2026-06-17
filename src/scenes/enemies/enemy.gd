class_name Enemy extends CharacterBody2D

@onready var hit_box: HitBox = $HitBox
@onready var health: Health = $Health
@onready var mutations_balls: MutationBalls = $UI/MutationBalls

const DAMAGE_MUTATION_MAP: Dictionary = {
	Enums.DamageSource.BULLET_WHITE: Enums.Mutation.WHITE,
	Enums.DamageSource.BULLET_RED: Enums.Mutation.RED
}

var target
var mutations: Array[Enums.Mutation]

func _ready() -> void:
	hit_box.damage_taken.connect(_on_hit_box_damage_taken)
	health.health_depleted.connect(_on_health_health_depleted)
	mutations_balls.init_mutations(mutations)

func _on_hit_box_damage_taken(damage_source: Enums.DamageSource) -> void:
	if mutations.size() == 0:
		health.take_damage(50)
	
	var target_mutation: Enums.Mutation = DAMAGE_MUTATION_MAP[damage_source]
	var target_index: int = mutations.find(target_mutation)
	if target_index != -1:
		mutations.remove_at(target_index)
		mutations_balls.remove_mutation(target_mutation)

func _on_health_health_depleted() -> void:
	queue_free()
