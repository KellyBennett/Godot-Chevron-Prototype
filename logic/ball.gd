extends RigidBody2D

const INITIAL_SPEED = 500.0
const FRICTION = 0.8  # Adjust friction to tweak rotational effect

func _ready():
	linear_velocity = Vector2(INITIAL_SPEED, 0)
	angular_velocity = 290
