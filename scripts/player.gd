extends CharacterBody2D

var speed: float = 250.0
var dash_speed: float = 650.0 
var dash_duration: float = 0.18
var dash_cooldown: float = 0.45

var dash_time_left: float = 0.0
var cooldown_time_left: float = 0.0

var dash_direction: Vector2 = Vector2.DOWN
var last_move_direction: Vector2 = Vector2.DOWN

func _physics_process(delta: float) -> void:
	var direction:= Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction != Vector2.ZERO:
		last_move_direction = direction.normalized()
		
	dash_time_left = maxf(dash_time_left - delta, 0.0)
	cooldown_time_left = maxf(cooldown_time_left - delta, 0.0)
	
	if Input.is_action_just_pressed("dash") and cooldown_time_left <= 0.0:
		start_dash(direction)

	if dash_time_left > 0.0:
		velocity = dash_direction * dash_speed
	else:
		velocity = direction * speed
		
	move_and_slide()
	
func start_dash(direction: Vector2) -> void:
	if direction != Vector2.ZERO:
		dash_direction = direction.normalized()
	else:
		dash_direction = last_move_direction
	
	dash_time_left = dash_duration
	cooldown_time_left = dash_cooldown
