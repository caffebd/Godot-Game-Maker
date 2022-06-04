extends AnimatedSprite

export var distance = 500

var startX = 0

var forward = true

export var speed = 40

func _ready():
	startX = position.x

func _process(delta):
	flip_h = !forward
	position = Vector2(position.x + speed * delta, position.y)
	if forward:		
		if position.x > (startX + distance):
			forward = false
			speed = speed * -1
	else:
		if position.x <= startX:
			forward = true
			speed = speed * -1
				
	
