extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -800.0
const sprint_speed = 1000.0
var extra_jump_count = 1
@onready var animation_sprite = $AnimationPlayer
@onready var animek = $AnimatedSprite2D
@onready var dash_timer: Timer = $dash_timer
@onready var next_dash_timer: Timer = $next_dash_timer

const DASH_SPEED = 1500.0
var dashing = false
var can_dash = true

func _process(_delta: float) -> void:
	#dumbahh died
	if Global.lifes <= 0:
		get_tree().reload_current_scene()
		Global.lifes = 1
		Global.no_move = false

func _physics_process(delta: float) -> void:
	
	var camera_position = $Camera2D.global_position
	
	#stopowanie sterowania
	if camera_position.y > 1500:
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
		extra_jump_count -= 1
		
	#dashowanie
	if Input.is_action_just_pressed("dash") and can_dash:
		dashing = true
		can_dash = false
		dash_timer.start()
		
	#sterowanie
	if Global.no_move == false:
		var direction := Input.get_axis("lewo_gracz_1", "prawo_gracz_1")
		if direction:
			#sprintowanie + dash
			if Input.is_action_pressed("sprint") and dashing:
				velocity.x = direction * (sprint_speed + DASH_SPEED)
			#sprintowanie
			elif Input.is_action_pressed("sprint"):
				velocity.x = direction * sprint_speed
			#dashowanie
			elif dashing:
				velocity.x = direction * DASH_SPEED
			else:
				velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		#animacje
		if dashing == true and direction  != 0:
			animation_sprite.play("dashing")
		elif is_on_floor() and direction != 0 and Input.is_action_pressed("sprint"):
			animation_sprite.play("sprint")
		elif is_on_floor() and direction != 0:
			animation_sprite.play("walk")
		elif !is_on_floor() and velocity.y < 0:
			animation_sprite.play("jump")
		elif !is_on_floor() and velocity.y > 0:
			animation_sprite.play("falling")
		elif is_on_floor():
			animation_sprite.play("Idle")
		
		if direction < 0:
			animek.flip_h = true
			$HitBox/CollisionShape2D.position.x = -90
		elif direction > 0:
			animek.flip_h = false
			$HitBox/CollisionShape2D.position.x = 90
	else:
		velocity.x = 0
	move_and_slide()


func _on_dash_timer_timeout() -> void:
	dashing = false
	next_dash_timer.start()


func _on_next_dash_timer_timeout() -> void:
	can_dash = true
