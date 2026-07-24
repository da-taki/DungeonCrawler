extends CharacterBody2D

var velocity_player: float = 250.0

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		position.y -= velocity_player*delta
	elif Input.is_action_pressed("ui_down"):
		position.y += velocity_player*delta
	elif Input.is_action_pressed("ui_right"):
		position.x += velocity_player*delta
	elif Input.is_action_pressed("ui_left"):
		position.x -= velocity_player*delta
		
	move_and_slide()
		
