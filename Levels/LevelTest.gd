extends Node2D

signal continue_conversation
signal received_answer

var mumDone = false
var mumNoMoreSpeak = false

func _ready():
	Inventory.canChangeLevel = false
	Inventory.currentLevel = 2

func _on_Mum_body_entered(body):
	if not mumDone and body.get_groups().has("player"):
		mumDone = true
		if Inventory.myInventory.has("book"):
			_conversation("roksanaMumBook", "mumBook", true)
		else:
			mumDone = true
			_conversation("roksanaMumNoBook", "mumNoBook", false)
		return
	
	if mumDone and not mumNoMoreSpeak and body.get_groups().has("player"):
		if Inventory.myInventory.has("book"):
			mumNoMoreSpeak = true
			_conversation("mumFoundBook", "roksanaMumFoundBook", true)
		else:
			$RobotPlayer/iTime.visible = true
			Inventory.canChangeLevel = true
		return
	if body.get_groups().has("player"):
		$RobotPlayer/iTime.visible = true
		Inventory.canChangeLevel = true

func _conversation(personA: String, personB: String, askFruits: bool):
	$RobotPlayer.is_active = false
	$RobotPlayer/MainSpokenText.visible = true
	$RobotPlayer/Speaker.visible = true

	var partA = Level3SpokenText.people[personA]
	var partB = []
	if personB != "":
		partB = Level3SpokenText.people[personB]

	for i in partA.size():
		var speaker = personA
		if "roksana" in speaker:
			speaker = "Roksana"
		if "mum" in speaker:
			speaker = "Mum"
		$RobotPlayer/Speaker.text = speaker
		$RobotPlayer/MainSpokenText.text = partA[i]
		yield (self, "continue_conversation")		
		if partB.size() > 0 and i <= partB.size()-1:
			speaker = personB
			if "roksana" in speaker:
				speaker = "Roksana"
			if "mum" in speaker:
				speaker = "Mum"
			$RobotPlayer/Speaker.text = speaker
			$RobotPlayer/MainSpokenText.text = partB[i]
			yield (self, "continue_conversation")
	
	if askFruits:
		$RobotPlayer/Speaker.text = "Mum"
		$RobotPlayer/MainSpokenText.text ="Should I bring these fruits with me?"
		$RobotPlayer/Buttons.visible = true
		mumNoMoreSpeak = true
		yield (self, "received_answer")
	
	$RobotPlayer/MainSpokenText.text = ""
	$RobotPlayer/MainSpokenText.visible = false
	$RobotPlayer/Speaker.visible = false
	$RobotPlayer.is_active = true
	$RobotPlayer/iTime.visible = true
	Inventory.canChangeLevel = true


func _input(_event):
	if Input.is_action_just_pressed("attack"):
		emit_signal("continue_conversation")


func _on_YesButton_pressed():
	$RobotPlayer/MainSpokenText.text ="Great, let's get home!"
	$RobotPlayer/Buttons.visible = false
	yield (self, "continue_conversation")
	emit_signal("received_answer")


func _on_NoButton_pressed():
	$RobotPlayer/MainSpokenText.text ="You're probably right. Let's get home!"
	$RobotPlayer/Buttons.visible = false
	yield (self, "continue_conversation")
	emit_signal("received_answer")


func _on_Mum_body_exited(body):
	$RobotPlayer/iTime.visible = false
	Inventory.canChangeLevel = false
