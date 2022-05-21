tool
extends Node2D

export var duration: float = 1
export var move_from: Vector2 = Vector2.ZERO
export var move_to: Vector2 = Vector2.ZERO

export var active: bool = true

onready var line: Node2D = $Debug_Line
onready var base: Node2D = $Base
onready var tween: Tween = $Base/Tween

var direction_forward = true

var audioPlaying: bool = false

func _ready():
	if not Engine.is_editor_hint():
		set_tween(move_from, move_to)

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
		if  $Base/PlatformSound.playing:
			$Base/PlatformSound.stop()


func _on_Tween_tween_completed(_object, _key):
	
	direction_forward = !direction_forward
	
	if direction_forward:
		set_tween(move_from, move_to)
	else:
		set_tween(move_to, move_from)
	
	
		


func _on_Switch2_control(state):
	active = state
	if active:
		if direction_forward:
			set_tween(move_from, move_to)
		else:
			set_tween(move_to, move_from)
