class_name MutationBalls extends Control

const MUTATION_ICON_MAP: Dictionary = {
	Enums.Mutation.TRIANGLE: "res://assets/images/ui/mutations/circle-white.png",
	Enums.Mutation.DIAMOND: "res://assets/images/ui/mutations/circle-red.png",
	Enums.Mutation.RECTANGLE: "res://assets/images/ui/mutations/circle-green.png",
	Enums.Mutation.STAR: "res://assets/images/ui/mutations/circle-blue.png",
}

var mutation_balls: Dictionary[Enums.Mutation, Array]
	
func init_mutations(mutations: Array[Enums.Mutation]):
	for mutation in mutations:
		var texture_rect: TextureRect = TextureRect.new()
		texture_rect.texture = load(MUTATION_ICON_MAP[mutation])
		add_child(texture_rect)
		# Save node in the dictionary
		if (mutation_balls.has(mutation)):
			mutation_balls[mutation].append(texture_rect)
		else:
			mutation_balls[mutation] = [texture_rect]

func remove_mutation(mutation: Enums.Mutation):
	var texture_rects: Array = mutation_balls[mutation]
	if texture_rects.size() > 0:
		var texture_rect: TextureRect = texture_rects.pop_back()
		texture_rect.queue_free()
