class_name Player
extends Node2D

@export var host: Enemy

func _process(delta) -> void:
	if host:
		faceInDirection()
		followHost()
	
func _physics_process(delta) -> void:
	if host:
		moveHost(delta)

func faceInDirection() -> void:
	var newDirection: Vector2 = (get_global_mouse_position() - position).normalized()
	if newDirection != Vector2.ZERO:
		rotation = atan2(newDirection.y, newDirection.x)

func moveHost(delta: float) -> void:
	var moveDirection: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	host.velocity = moveDirection * host.maxSpeed
	host.move_and_slide()
	
func followHost() -> void:
	position = host.position
