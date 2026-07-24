extends CharacterBody2D

@export var speed: float = 100.0

var player: CharacterBody2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player") as CharacterBody2D
	
func _physics_process(delta: float) -> void:
	if not is_instance_valid(player):
		velocity = Vector2.ZERO
		return
		
	var direction:= global_position.direction_to(player.global_position)
	
	velocity = direction * speed
	move_and_slide()
