class_name Rhinovirus extends Enemy

const rhinovirus_scene: PackedScene = preload("res://scenes/enemies/rhinovirus/rhinovirus.tscn")

const MAX_SPEED: float = 50

static func create(p_target: Node2D, p_position: Vector2, p_mutations: Array[Enums.Mutation]) -> Rhinovirus:
	var rhinovirus: Rhinovirus = rhinovirus_scene.instantiate()
	rhinovirus.target = p_target
	rhinovirus.global_position = p_position
	rhinovirus.mutations = p_mutations
	
	# Add componenets
	var follow: Follow = Follow.create(p_target, MAX_SPEED)
	rhinovirus.add_child(follow)
		
	return rhinovirus
	
func _ready() -> void:
	super._ready()
