extends KinematicBody2D

var gravity = 400.0
const WALK_SPEED = 200
const JUMP_FORCE = 620

signal player_hit

var onLadder: bool = false


var velocity = Vector2()

var is_attacking:bool = false
var myDirection: int = 1

var startPosition: Vector2 = Vector2.ZERO

const robot_shoot = preload("res://Robot_Shoot.tscn")

func _ready():
	startPosition = position

func _physics_process(delta):
	velocity.y += delta * gravity
	
	if not is_attacking:
		if Input.is_action_pressed("ui_left"):
			velocity.x = -WALK_SPEED
			myDirection = -1
			$AnimatedSprite.flip_h = velocity.x < 0
			if is_on_floor():
				$AnimatedSprite.animation = "walk"		
				$AnimatedSprite.play()
		elif Input.is_action_pressed("ui_right"):
			velocity.x =  WALK_SPEED
			myDirection = 1
			$AnimatedSprite.flip_h = velocity.x < 0
			if is_on_floor():
				$AnimatedSprite.animation = "walk"	
				$AnimatedSprite.play()
		else:
			velocity.x = 0
			



	if not onLadder:
		gravity = 400
	# Check for jumping. is_on_floor() must be called after movement code.
		if is_on_floor() and Input.is_action_just_pressed("jump"):
			velocity.y = -JUMP_FORCE

		if not is_on_floor():
			$AnimatedSprite.animation = "jump"	
			$AnimatedSprite.play()
	else:
		gravity = 0
		if Input.is_action_pressed("jump"):
			velocity.y = -WALK_SPEED
			$AnimatedSprite.animation = "climb"	
			$AnimatedSprite.play()
		elif Input.is_action_pressed("duck"):
			velocity.y = WALK_SPEED
			$AnimatedSprite.animation = "climb"	
			$AnimatedSprite.play()
		else:
			velocity.y=0
			#$AnimatedSprite.animation = "climb"
			if not is_on_floor():
				$AnimatedSprite.stop()
			
		
			
		
	
#	if is_on_floor() and Input.is_action_pressed("attack"):
#		velocity.x = 0
#		is_attacking = true
#		$AnimatedSprite.animation = "attack"	
#		$AnimatedSprite.play()
	if is_on_floor() and Input.is_action_pressed("duck"):
		velocity.x = 0
		$AnimatedSprite.animation = "duck"	
		$AnimatedSprite.play()
		is_attacking = false
	# TEST NEW ANIMATIONS HERE


	#THIS CODE IS LAST		
	elif is_on_floor() and abs(velocity.x) < 0.1:
		$AnimatedSprite.animation = "idle"	
		$AnimatedSprite.play()
		is_attacking = false
	
	if Input.is_action_just_pressed("attack"):
		var shoot = robot_shoot.instance()
		shoot.direction = myDirection
		shoot.startPosition = Vector2(position.x, position.y + 25)
		get_parent().add_child(shoot)	
		
	
	
		
	velocity.y += gravity * delta

	# Move based on the velocity and snap to the ground.
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)

	if position.y > startPosition.y + 1500:
		position = get_parent().get_node("Position2D").position
		$PlayerCam.shake(1000)


	for i in get_slide_count():
		var collision = get_slide_collision(i)
		var gps = collision.collider.get_groups()
		if gps.has("enemy"):
			emit_signal("player_hit")


func _on_RobotPlayer_player_hit():
	$ProgressBar.value -=0.5 # Replace with function body.


func _on_Ghost_player_detected():
	$ProgressBar.value -=0.5 # Replace with function body.



func _on_Health_body_entered(_body):
	$ProgressBar.value +=10
	


func _on_Ladder_body_entered(body):
	onLadder = true


func _on_Ladder_body_exited(body):
	onLadder = false
