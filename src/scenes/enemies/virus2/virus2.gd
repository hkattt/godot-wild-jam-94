class_name Virus2 extends Enemy

const virus2_scene: PackedScene = preload("res://scenes/enemies/virus2/virus2.tscn")

const MAX_SPEED: float = 90

static func create(p_target: Node2D, p_position: Vector2, p_mutations: Array[Enums.Mutation]) -> Virus2:
	var virus2: Virus2 = virus2_scene.instantiate()
	virus2.target = p_target
	virus2.global_position = p_position
	virus2.mutations = p_mutations
	
	# Add componenets
	var follow: Follow = Follow.create(p_target, MAX_SPEED)
	virus2.add_child(follow)
		
	return virus2
	
func _ready() -> void:
	super._ready()
