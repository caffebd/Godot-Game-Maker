extends KinematicBody2D

var gravity = 400.0
const WALK_SPEED = 200
const JUMP_FORCE = 350

signal player_hit

var onLadder: bool = false

var velocity = Vector2()

var is_active: bool = true

var canFly: bool = false

var invisible: bool = false

var is_attacking:bool = false
var myDirection: int = 1

var startPosition: Vector2 = Vector2.ZERO

onready var inventory_items = $InventorySystem/ItemList

const robot_shoot = preload("res://Robot_Shoot.tscn")

func _ready():
	startPosition = position

func _physics_process(delta):
	velocity.y += delta * gravity
	
	if Input.is_action_just_pressed("show_inventory"):
		open_inventory()
		
	if not is_active and is_on_floor():
		$AnimatedSprite.animation = "idle"	
		$AnimatedSprite.play()
		return
	
	if not is_attacking:
		if Input.is_action_pressed("move_left"):
			velocity.x = -WALK_SPEED
			myDirection = -1
			$AnimatedSprite.flip_h = velocity.x < 0
			if is_on_floor():
				$AnimatedSprite.animation = "walk"		
				$AnimatedSprite.play()
		elif Input.is_action_pressed("move_right"):
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
		if not canFly and is_on_floor() and Input.is_action_just_pressed("jump"):
			velocity.y = -JUMP_FORCE
		
		if canFly and Input.is_action_pressed("jump"):
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
	
#	if Input.is_action_just_pressed("attack"):
#		print ($ProgressBar.value)
#		var shoot = robot_shoot.instance()
#		shoot.direction = myDirection
#		shoot.startPosition = Vector2(position.x, position.y + 25)
#		get_parent().add_child(shoot)	
		
	
	
		
	velocity.y += gravity * delta

	# Move based on the velocity and snap to the ground.
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)

	if position.y > startPosition.y + 1500:
		restart(false)


	for i in get_slide_count():
		var collision = get_slide_collision(i)
		var gps = collision.collider.get_groups()
		if gps.has("enemy"):
			emit_signal("player_hit")

func restart(reset):
	position = startPosition
	$PlayerCam.shake(1000)
	
	if reset:
		$ResetTimer.start()

func check_health():
	if $ProgressBar.value <= 0:
		restart(true)

func _on_RobotPlayer_player_hit():
	if $ProgressBar.value > 0:
		$ProgressBar.value -=0.5 # Replace with function body.
	else:
		restart(true)

func _on_Ghost_player_detected():
	if $ProgressBar.value > 0:
		$ProgressBar.value -=0.5 # Replace with function body.
	else:
		restart(true)

func full_health():
	$ProgressBar.value = 100

func _on_Health_body_entered(_body):
	$ProgressBar.value +=10
	


func _on_Ladder_body_entered(_body):
	print ("on ladder")
	onLadder = true


func _on_Ladder_body_exited(_body):
	onLadder = false


func _on_ResetTimer_timeout():
	$ProgressBar.value = 100

func enable_fly(flyValue):
	if flyValue == true:
		canFly = true
		yield(get_tree().create_timer(30), "timeout")
		enable_fly(false)
	else:
		canFly = false

func turn_invisible(invValue):
	if invValue == true:
		invisible = true
		set_collision_mask_bit(1, false )
		set_collision_layer_bit(1, true)
		set_collision_layer_bit(0, false)
		modulate.a = 0.4
		yield(get_tree().create_timer(30), "timeout")
		turn_invisible(false)
	else:
		set_collision_layer_bit(1, true )
		set_collision_layer_bit(0, true)
		set_collision_layer_bit(1, false)
		modulate.a = 1
		invisible = false

func open_inventory():
	update_inventory()
	$InventorySystem.visible = not $InventorySystem.visible 
	
func update_inventory():
	inventory_items.clear()
	for item in Inventory.myInventory:
		match item:
			"key":
				$InventorySystem/ItemList.add_icon_item(Inventory.theKey)				
			"grass":
				$InventorySystem/ItemList.add_icon_item(Inventory.theGrass)
			"iTime15":
				$InventorySystem/ItemList.add_icon_item(Inventory.iTime15)
		

func show_player_info_box(msg: String):
	$PlayerCam/InfoBox.text = msg
	$PlayerCam/InfoBox.visible = true

func hide_player_info_box():
	$PlayerCam/InfoBox.visible = false
	
