class_name Player
extends RigidBody2D

@export var host: Enemy
@export var throwPower: float = 1000.0
var forwardDirection: Vector2 = Vector2(1, 0)

func _process(delta) -> void:
	if host:
		faceInDirection()
		followHost()
		throwSelf()
	print("fps ", 1/delta) # bc why not

func _physics_process(delta) -> void:
	if host:
		moveHost(delta)
	else: # slow down when thrown
		linear_velocity = linear_velocity.move_toward(Vector2.ZERO, throwPower*delta)

func faceInDirection() -> void: # faces the sword in the direction of the mouse or right stick
	var newDirection: Vector2 = (get_global_mouse_position() - position).normalized()
	if newDirection != Vector2.ZERO: # in case the last direction is 0, ignore it
		forwardDirection = newDirection
		rotation = atan2(newDirection.y, newDirection.x) # rotating

func moveHost(delta: float) -> void: # moves the host instead of the player node
	var moveDirection: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if moveDirection != Vector2.ZERO: # accelerate (rate is max speed x 4)
		host.velocity = host.velocity.move_toward(moveDirection*host.maxSpeed, host.maxSpeed*delta*4)
	else: # decelerate at a faster rate
		host.velocity = host.velocity.move_toward(Vector2.ZERO, host.maxSpeed*delta*8)
	host.move_and_slide()

func throwSelf() -> void:
	if Input.is_action_just_pressed("throw"):
		host = null # removes self from host
		linear_velocity = forwardDirection*throwPower

func followHost() -> void:
	position = host.position
