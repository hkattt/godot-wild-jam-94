class_name Maps extends RefCounted

const DAMAGE_MUTATION_MAP: Dictionary = {
	Enums.DamageSource.BULLET_TRIANGLE: Enums.Mutation.TRIANGLE,
	Enums.DamageSource.BULLET_DIAMOND: Enums.Mutation.DIAMOND,
	Enums.DamageSource.BULLET_RECTANGLE: Enums.Mutation.RECTANGLE,
	Enums.DamageSource.BULLET_STAR: Enums.Mutation.STAR
}

const MEMORY_CELL_MUTATION_MAP: Dictionary = {
	Enums.MemoryCell.TRIANGLE: Enums.Mutation.TRIANGLE,
	Enums.MemoryCell.DIAMOND: Enums.Mutation.DIAMOND,
	Enums.MemoryCell.RECTANGLE: Enums.Mutation.RECTANGLE,
	Enums.MemoryCell.STAR: Enums.Mutation.STAR,
}
