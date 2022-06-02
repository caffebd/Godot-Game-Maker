tool
extends Node2D

export var duration: float = 0.5
export var move_from: Vector2 = Vector2.ZERO
export var move_to: Vector2 = Vector2.ZERO

export var active: bool = true

onready var line: Node2D = $Debug_Line
onready var base: Node2D = $Base
onready var tween: Tween = $Base/Tween



export var direction_forward = true

var audioPlaying: bool = false

onready var player = get_node("../RobotPlayer")

func _ready():
	if not Engine.is_editor_hint():
		set_tween(move_from, move_to)
	if direction_forward:
		$Base/Block1/BlockRight.disabled = false
		$Base/Block2/BlockLeft.disabled = true
		$StaticBody2D/RightBank.disabled = false
		$StaticBody2D2/LeftBank.disabled = true
	else:
		$Base/Block1/BlockRight.disabled = true
		$Base/Block2/BlockLeft.disabled = false
		$StaticBody2D/RightBank.disabled = true
		$StaticBody2D2/LeftBank.disabled = false
			

func _process(_delta):
	if Engine.is_editor_hint():
		update()
#	else:
#		if active and not audioPlaying:
#			$Base/PlatformSound.play()
#			audioPlaying = true
#		if not active:
#			$Base/PlatformSound.stop()
#			audioPlaying = false

func _draw():
	if Engine.is_editor_hint():
		if line:
			draw_line(line.position + move_from, line.position + move_to, Color.lime,2)
			


func set_tween(from, to):
	if active:
		var _moving = tween.interpolate_property(base, "position", from, to, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		var _moveStart = tween.start()
		if not $Base/PlatformSound.playing:
			$Base/PlatformSound.play()
	else:
		if $Base/PlatformSound.playing:
			$Base/PlatformSound.stop()


func _on_Tween_tween_completed(_object, _key):
	if $Base/PlatformSound.playing:
		$Base/PlatformSound.stop()
	get_parent().lost_stick()
	active = false
	direction_forward = !direction_forward
	if direction_forward:
		$Base/Block1/BlockRight.disabled = false
		$Base/Block2/BlockLeft.disabled = true
		$StaticBody2D/RightBank.disabled = false
		$StaticBody2D2/LeftBank.disabled = true		
		
	else:
		$Base/Block1/BlockRight.disabled = true
		$Base/Block2/BlockLeft.disabled = false
		$StaticBody2D/RightBank.disabled = true
		$StaticBody2D2/LeftBank.disabled = false		

	
	
		


func _on_Switch2_control(state):
	active = state
	if active:
		if direction_forward:
			set_tween(move_from, move_to)
		else:
			set_tween(move_to, move_from)
			
func check_action(obj, index):
	if obj == "stick":
		player.canMove = false
		active = true
		Inventory.myInventory.remove(index)
		player.update_inventory()

		if direction_forward:
			set_tween(move_from, move_to)
		else:
			set_tween(move_to, move_from)
		


func _on_OnLog_body_entered(body):
	if body.get_groups().has("player"):
		$Base/StickHint.visible = true
		Inventory.current_action_object = self



func _on_OnLog_body_exited(body):
	if body.get_groups().has("player"):
		$Base/StickHint.visible = false
		Inventory.current_action_object = null
