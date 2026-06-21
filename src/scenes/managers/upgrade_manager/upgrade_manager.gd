class_name UpgradeManager extends Node2D

@export var game_arena: GameArena
@export var upgrade_menu: UpgradeMenu

var character: Character
var gun: Gun

const SPEED_INCREASE: float = 15.0
const HEAL_AMOUNT: float = 200.0
const HEALTH_INCREASE: float = 50.0
const FIRE_RATE_INCREASE: float = 0.05

func _ready() -> void:
	character = game_arena.character
	gun = character.get_gun()
	upgrade_menu.close_menu.connect(_on_close_menu)

func generate_upgrade_options() -> Array[Enums.Upgrade]:
	var upgrades: Array[Enums.Upgrade] = []
	var options: Array = Enums.Upgrade.values()
	
	for i in range(3):
		var upgrade_index = generate_upgrade_option(options)
		var upgrade = options.pop_at(upgrade_index)
		upgrades.append(upgrade)
	
	return upgrades

func generate_upgrade_option(options: Array) -> int:
	var random_index = randi_range(0, options.size() - 1)
	var upgrade: Enums.Upgrade = options[random_index]
	
	var memory_cells = gun.get_memory_cells()
	
	match upgrade:
		Enums.Upgrade.MEMORY_CELL_RECTANGLE:
			if Enums.MemoryCell.RECTANGLE in memory_cells:
				return generate_upgrade_option(options)
		Enums.Upgrade.MEMORY_CELL_DIAMOND:
			if Enums.MemoryCell.DIAMOND in memory_cells:
				return generate_upgrade_option(options)	
		Enums.Upgrade.MEMORY_CELL_STAR:
			if Enums.MemoryCell.STAR in memory_cells:
				return generate_upgrade_option(options)	
		Enums.Upgrade.GUN_BURST:
			if gun.spray_patten == Enums.BulletPattern.BURST:
				return generate_upgrade_option(options)	
		
	return random_index
		
func _on_close_menu(upgrade: Enums.Upgrade) -> void:
	match upgrade:
		Enums.Upgrade.CHARACTER_HEAL:
			character.heal(HEAL_AMOUNT)
		Enums.Upgrade.CHARACTER_HEALTH:
			character.increase_max_health(HEALTH_INCREASE)
		Enums.Upgrade.CHARACTER_MOVE_SPEED:
			character.increase_speed(SPEED_INCREASE)
		Enums.Upgrade.MEMORY_CELL_DIAMOND:
			gun.add_memory_cell(Enums.MemoryCell.DIAMOND)
		Enums.Upgrade.MEMORY_CELL_RECTANGLE:
			gun.add_memory_cell(Enums.MemoryCell.RECTANGLE)
		Enums.Upgrade.MEMORY_CELL_STAR:
			gun.add_memory_cell(Enums.MemoryCell.STAR)
		Enums.Upgrade.GUN_FIRE_RATE:
			gun.increase_fire_rate(FIRE_RATE_INCREASE)
		#Enums.Upgrade.GUN_DAMAGE:
			#gun.increase_fire_rate()
		Enums.Upgrade.GUN_BURST:
			gun.set_spray_pattern(Enums.BulletPattern.BURST)
