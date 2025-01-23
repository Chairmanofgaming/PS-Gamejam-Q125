class_name Enemy
extends CharacterBody2D

@export var maxSpeed: float = 500.0

func onDeath() -> void:
	queue_free()

func moveHost(delta: float) -> void: # moves the host instead of the player node
	var moveDirection: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if moveDirection != Vector2.ZERO: # accelerate (rate is max speed x 4)
		velocity = velocity.move_toward(moveDirection*maxSpeed, maxSpeed*delta*4)
	else: # decelerate at a faster rate
		velocity = velocity.move_toward(Vector2.ZERO, maxSpeed*delta*8)
	move_and_slide()
