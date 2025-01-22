class_name Player
extends Node2D

@export var host: Enemy

func _process(delta) -> void:
	faceInDirection()

func faceInDirection():
	var newDirection: Vector2 = (get_global_mouse_position() - position).normalized()
	if newDirection != Vector2.ZERO:
		rotation = atan2(newDirection.y, newDirection.x)

