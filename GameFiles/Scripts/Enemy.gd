class_name Enemy
extends CharacterBody2D

@export var maxSpeed: float = 500.0

func onDeath() -> void:
	queue_free()
