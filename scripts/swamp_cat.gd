extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

const  Speed  = 100

var direction = 1
var health = 1
var distance = 0
@export var max_distance = 300

func _add_gravity(delta):
	if !is_on_floor():
		velocity += get_gravity() * delta

func _move_enemy():
	velocity.x = Speed * direction
	distance += float(Speed * direction)/100
		
func _on_reverse():
	if distance <= 0 or distance >= max_distance:
		direction = -direction
	if direction > 0:
		anim.flip_h = true
		$HurtBox/CollisionShape2D.position.x = 20
		$CollisionShape2D.position.x = 20
		$HitBox/CollisionShape2D.position.x = 88
	elif direction < 0:
		anim.flip_h = false
		$HurtBox/CollisionShape2D.position.x = -3
		$CollisionShape2D.position.x = -3
		$HitBox/CollisionShape2D.position.x = -88
		
	
func _physics_process(delta: float) -> void:
	_add_gravity(delta)
	_move_enemy()
	move_and_slide()
	_on_reverse()
	
