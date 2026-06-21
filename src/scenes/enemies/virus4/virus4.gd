class_name Virus4 extends Enemy

const virus4_scene: PackedScene = preload("res://scenes/enemies/virus4/virus4.tscn")

const MAX_SPEED: float = 50

static func create(p_target: Node2D, p_position: Vector2, p_mutations: Array[Enums.Mutation]) -> Virus4:
	var virus4: Virus4 = virus4_scene.instantiate()
	virus4.target = p_target
	virus4.global_position = p_position
	virus4.mutations = p_mutations
	
	# Add componenets
	var follow: Follow = Follow.create(p_target, MAX_SPEED)
	virus4.add_child(follow)
		
	return virus4
	
func _ready() -> void:
	super._ready()
