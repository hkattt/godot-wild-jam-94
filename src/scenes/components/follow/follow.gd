class_name Follow extends Node2D

@onready var parent: CharacterBody2D = get_parent()
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var timer: Timer = $Timer

const follow_scene: PackedScene = preload("res://scenes/components/follow/follow.tscn")

var target: Node2D
var speed: float
var direction: Vector2 = Vector2.ZERO

static func create(p_target: Node2D, p_speed: float) -> Follow:
	var follow: Follow = follow_scene.instantiate()
	follow.target = p_target
	follow.speed = p_speed
	return follow

func _ready() -> void:
	navigation_agent.set_target_position(target.global_position)
	navigation_agent.velocity_computed.connect(Callable(_on_velocity_computed))
	timer.start(1)

func _physics_process(_delta: float) -> void:
	if !target: return
		
	# Do not query when the map has never synchronized and is empty.
	if NavigationServer2D.map_get_iteration_id(navigation_agent.get_navigation_map()) == 0:
		return
	if navigation_agent.is_navigation_finished():
		return
	
	direction = parent.global_position.direction_to(navigation_agent.get_next_path_position())
	var new_velocity: Vector2 = speed * direction
	navigation_agent.set_velocity(new_velocity)
	
	if navigation_agent.avoidance_enabled:
		navigation_agent.set_velocity(new_velocity)
	else:
		_on_velocity_computed(new_velocity)
			
func _on_velocity_computed(safe_velocity: Vector2) -> void:
	parent.velocity = safe_velocity
	parent.move_and_slide()

func _on_timer_timeout() -> void:
	navigation_agent.set_target_position(target.global_position)
