class_name Virus1 extends Enemy

const virus1_scene: PackedScene = preload("res://scenes/enemies/virus1/virus1.tscn")

const MAX_SPEED: float = 50

static func create(p_target: Node2D, p_position: Vector2, p_mutations: Array[Enums.Mutation]) -> Virus1:
	var virus1: Virus1 = virus1_scene.instantiate()
	virus1.target = p_target
	virus1.global_position = p_position
	virus1.mutations = p_mutations
	
	# Add componenets
	var follow: Follow = Follow.create(p_target, MAX_SPEED)
	virus1.add_child(follow)
		
	return virus1
	
func _ready() -> void:
	super._ready()
