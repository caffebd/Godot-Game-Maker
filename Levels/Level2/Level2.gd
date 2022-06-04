extends Node2D

var dadDone = false
var dadNoMoreSpeak = false

signal continue_conversation

func _ready():
	Inventory.canChangeLevel = true
	Inventory.currentLevel = 2	
	#TEMP CODE FOR TEST
#	Inventory.add_to_inventory("iTime15")
#	$RobotPlayer.update_inventory()
	$RobotPlayer.climb_type = "climb_vine"
	#END TEMP CODE


func _conversation(personA: String, personB: String):
	$RobotPlayer.is_active = false
	$RobotPlayer/MainSpokenText.visible = true
	$RobotPlayer/Speaker.visible = true
	
	var speaker = "none"

	var partA = Level2SpokenText.people[personA]
	var partB = []
	if personB != "":
		partB = Level2SpokenText.people[personB]

	for i in partA.size():
		speaker = _get_person_name(personA)
		$RobotPlayer/Speaker.text = speaker
		$RobotPlayer/MainSpokenText.text = partA[i]
		yield (self, "continue_conversation")		
		if partB.size() > 0 and i <= partB.size()-1:
			speaker = _get_person_name(personB)
			$RobotPlayer/Speaker.text = speaker
			$RobotPlayer/MainSpokenText.text = partB[i]
			yield (self, "continue_conversation")
			print (i)
		
			if personB == "scientistChange" and i == 8:
				$ScientistEnd.scientist_leave()	
	$RobotPlayer/MainSpokenText.text = ""
	$RobotPlayer/MainSpokenText.visible = false
	$RobotPlayer/Speaker.visible = false
	$RobotPlayer.is_active = true


func _get_person_name(person: String):
	var speaker = person
	if "roksana" in person:
		speaker = "Roksana"
	if "dad" in person:
		speaker = "Dad"			
	return speaker


func _on_Dad_body_entered(body):
	if not dadDone and body.get_groups().has("player"):
		dadDone = true
		
		if Inventory.tissues_collected == 10:
			dadNoMoreSpeak = true
			_conversation("dadTissues", "roksanaDadTissues")
		else:
			dadDone = true
			_conversation("dadNoTissues", "roksanaDadNoTissues")
		return
	
	if dadDone and not dadNoMoreSpeak and body.get_groups().has("player"):
		if Inventory.tissues_collected == 10:
			dadNoMoreSpeak = true
			_conversation("roksanaFoundAllTissues", "dadFoundAllTissues")
		else:
			$RobotPlayer/iTime.visible = true
			Inventory.canChangeLevel = true
		return
	if body.get_groups().has("player"):
		$RobotPlayer/iTime.visible = true
		Inventory.canChangeLevel = true


func _on_Dad_body_exited(body):
	if body.get_groups().has("player"):
		$RobotPlayer/iTime.visible = false
		Inventory.canChangeLevel = false

func _input(_event):
	if Input.is_action_just_pressed("attack"):
		emit_signal("continue_conversation")

func first_tissue(tissue):
	var text = "Hmmm... this might be one of Dad's tissues..."
	if tissue > 1:
		text = "Another one? I wonder how many more there are..."
	$RobotPlayer/MainSpokenText.text = text
	$RobotPlayer/Speaker.text = "Roksana"
	$RobotPlayer/MainSpokenText.visible = true
	$RobotPlayer/Speaker.visible = true

	yield(get_tree().create_timer(3.0), "timeout")
	$RobotPlayer/MainSpokenText.visible = false
	$RobotPlayer/Speaker.visible = false

