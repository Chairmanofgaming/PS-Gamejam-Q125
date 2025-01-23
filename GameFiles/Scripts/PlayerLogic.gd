class_name Player
extends Area2D

#-- Conections
@export var host: Enemy
@onready var animator: AnimationPlayer = $Animator
@onready var sprite: Sprite2D = $WeaponSprite
@onready var speenCollider: CollisionShape2D = $SpeenCollider

#-- Variables
@export var throwPower: float = 1100.0
var forwardDirection: Vector2 = Vector2(1, 0)
var forwardRadians: float = 0.0
@export var rotationOffset: float = 0.0 # used for animations
@export var isSwinging: bool = false
var velocity: Vector2 = Vector2.ZERO

func _ready():
	swapNewHost(host)

func _process(delta) -> void:
	if host:
		position = host.position # follows the host
		rotation = forwardRadians + rotationOffset
		faceInDirection()
		throwSelf()
		swing()

func _physics_process(delta) -> void:
	if host:
		moveHost(delta)
	else: # slow down when thrown
		velocity = velocity.move_toward(Vector2.ZERO, throwPower*delta)
		animator.speed_scale = velocity.abs().length()/throwPower
	position += velocity * delta

func faceInDirection() -> void: # faces the sword in the direction of the mouse or right stick
	var newDirection: Vector2 = (get_global_mouse_position() - position).normalized()
	if !isSwinging and newDirection != Vector2.ZERO: # in case the last direction is 0, ignore it
		forwardDirection = newDirection
		forwardRadians = atan2(newDirection.y, newDirection.x) # rotating

func moveHost(delta: float) -> void: # moves the host instead of the player node
	var moveDirection: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if moveDirection != Vector2.ZERO: # accelerate (rate is max speed x 4)
		host.velocity = host.velocity.move_toward(moveDirection*host.maxSpeed, host.maxSpeed*delta*4)
	else: # decelerate at a faster rate
		host.velocity = host.velocity.move_toward(Vector2.ZERO, host.maxSpeed*delta*8)
	host.move_and_collide(host.velocity * delta)

func throwSelf() -> void: # throws self in the current looking direction
	if Input.is_action_just_pressed("throw"):
		animator.play("ThrowStartup")

func _on_animator_animation_finished(anim_name) -> void: # helper function for throwing
	if anim_name == "ThrowStartup":
		host.onDeath()
		host = null # removes self from host
		speenCollider.disabled = false
		velocity = forwardDirection*throwPower
		animator.play("Speen")

func swing() -> void: # playes the swing sword animation when the attack button is pressed
	if Input.is_action_just_pressed("attack"):
		animator.play("WeaponSwing")

func swapNewHost(newHost: Enemy) -> void: # swaps to new host
	animator.stop()
	animator.speed_scale = 1
	host = newHost
	sprite.position.x = 50
	speenCollider.disabled = true

func _on_body_entered(body: Enemy): # collision detection
	if host: # you can only hit with a swing if you have a host
		print("hit")
	else:
		call_deferred("swapNewHost", body)
