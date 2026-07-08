extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -700.0
const sprint_speed = 1200.00
var extra_jump_count = 1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if is_on_floor():
		extra_jump_count = 1
	
	if Input.is_action_just_pressed("skok_gracz_1") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("skok_gracz_1") and !is_on_floor() and extra_jump_count > 0:
		print("skok")
		velocity.y = JUMP_VELOCITY
		extra_jump_count = extra_jump_count -1
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("lewo_gracz_1", "prawo_gracz_1")
	if direction:
		if Input.is_action_pressed("sprint") and is_on_floor():
			velocity.x = direction * sprint_speed
		else:
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
