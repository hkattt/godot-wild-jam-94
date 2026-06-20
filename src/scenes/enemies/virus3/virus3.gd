class_name Virus3 extends Enemy

const virus3_scene: PackedScene = preload("res://scenes/enemies/virus3/virus3.tscn")

const MAX_SPEED: float = 50

static func create(p_target: Node2D, p_position: Vector2, p_mutations: Array[Enums.Mutation]) -> Virus3:
	var virus3: Virus3 = virus3_scene.instantiate()
	virus3.target = p_target
	virus3.global_position = p_position
	virus3.mutations = p_mutations
	
	# Add componenets
	var follow: Follow = Follow.create(p_target, MAX_SPEED)
	virus3.add_child(follow)
		
	return virus3
	
func _ready() -> void:
	super._ready()
