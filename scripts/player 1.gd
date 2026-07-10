extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -700.0
const sprint_speed = 1200.00
var extra_jump_count = 1
@onready var animation_sprite = $AnimatedSprite2D



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
		#animacje
		if is_on_floor() and direction != 0 and Input.is_action_pressed("sprint"):
			animation_sprite.play("sprint")
		elif is_on_floor() and direction != 0:
			animation_sprite.play("walk")
		elif !is_on_floor():
			animation_sprite.play("jump")
		elif is_on_floor():
			animation_sprite.play("Idle")
		
		if direction < 0:
			animation_sprite.flip_h = true
		else:
			animation_sprite.flip_h = false
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
