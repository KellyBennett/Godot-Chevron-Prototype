extends RigidBody2D

const MOVE_SPEED = 400.0
const FLICK_SPEED = 1000

func _ready():
	add_to_group("paddle")

func _physics_process(delta):
	var movement = Vector2.ZERO
	
	if Input.is_action_pressed("left_move_up"):
		movement.y -= 1
	if Input.is_action_pressed("left_move_down"):
		movement.y += 1
	if Input.is_action_pressed("left_move_left"):
		movement.x -= 1
	if Input.is_action_pressed("left_move_right"):
		movement.x += 1
	if Input.is_action_pressed("left_flick_clockwise"):
		apply_torque(FLICK_SPEED * delta)
	if Input.is_action_pressed("left_flick_anti_clockwise"):
		angular_velocity = -FLICK_SPEED
	# Set velocity based on input
	linear_velocity = movement.normalized() * MOVE_SPEED

func _integrate_forces(state):
	# Prevent external forces from affecting movement
	state.linear_velocity = linear_velocity
	#state.angular_velocity = 0  # Prevents unwanted rotation
