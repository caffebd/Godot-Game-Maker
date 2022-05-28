extends Node2D

onready var player = $Player

func check_command(cmd: String):
	var cmdFormat = cmd.replace(" ","").to_lower()
	
	match cmdFormat:
		"health=100":
			player.full_health()
			play_audio(true)
		"canfly=true":
			player.enable_fly(true)
			play_audio(true)
		"invisible=true":
			player.turn_invisible(true)
			play_audio(true)
		_:
			play_audio(false)			
	

func play_audio(state: bool):
	if state:
		$Terminal/codeCorrect.play()
	else:
		$Terminal/codeFail.play()		
