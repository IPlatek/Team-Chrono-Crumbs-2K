extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -700.0
const sprint_speed = 1200.00
var extra_jump_count = 1




func _physics_process(delta: float) -> void:
	
	var camera_position = $Camera2D.global_position
	
	#stopowanie sterowania
	if camera_position.y > 1300:
		Global.no_move = true
	
	# Grawitacja
	if not is_on_floor():
		velocity += get_gravity() * delta

	# skakanie
	if is_on_floor():
		extra_jump_count = 1
	
	if Input.is_action_just_pressed("skok_gracz_1") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		#double jump
	if Input.is_action_just_pressed("skok_gracz_1") and !is_on_floor() and extra_jump_count > 0:
		print("skok")
		velocity.y = JUMP_VELOCITY
		extra_jump_count = extra_jump_count -1
		
	#sterowanie
	if Global.no_move == false:
		var direction := Input.get_axis("lewo_gracz_1", "prawo_gracz_1")
		if direction:
			#sprintowanie
			if Input.is_action_pressed("sprint") and is_on_floor():
				velocity.x = direction * sprint_speed
			else:
				velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		velocity.x = 0
		
	#teleportowanie na start
	if Global.lifes <= 0:
		position.x = 1400
		position.y = 600
		velocity.y = 100
		Global.lifes = 1
		Global.no_move = false
	

	move_and_slide()
