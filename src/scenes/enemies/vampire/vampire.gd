class_name Vampire extends Enemy

const vampire_scene: PackedScene = preload("res://scenes/enemies/vampire/vampire.tscn")

const MAX_SPEED: float = 50

static func create(p_target: Node2D, p_position: Vector2, p_mutations: Array[Enums.Mutation]) -> Vampire:
	var vampire: Vampire = vampire_scene.instantiate()
	vampire.target = p_target
	vampire.global_position = p_position
	vampire.mutations = p_mutations
	
	# Add componenets
	var follow: Follow = Follow.create(p_target, MAX_SPEED)
	vampire.add_child(follow)
		
	return vampire
	
func _ready() -> void:
	super._ready()
