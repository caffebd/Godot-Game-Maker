extends RichTextLabel

var roksanaTextBanor = ["Hello Mr Banor, how is everything?", "Well, I guess not.", "Bye Mr Banor." ]
var banorText =  ["Oh, same as always. Nothing ever happens around here does it?", "Stay in school Roksana, I'm sure you have a bright future ahead of you.", "Goodbye Roksana."]

var roksanaTextBanorChange = ["Mr... Mr... Mr B.....", "You're a... a...", "How did this happen?", "Erm... no... No thank you. I'd better go!", "B...B... bye Mr Banor"]
var banorTextChange = ["Hello Roksana, how are you today?", "Everything ok?", "Oh I know. I'm normally closed on Monday but I decided to open up for a change. No need to look so shocked.", "I was just swinging around at home with nothing to do so though I would open the shop. Can I get you anything?", "Good girl, off to get your homework done.", "Bye Roksana."]

var roksanaTextFarmer = ["They're fine, thank you.", "Is everything okay on your farm", "That's good news. Well goodbye, I'd better get going."]
var farmerText = ["Hello Roksana, how's your family?", "That's good to hear.", "Pretty good, bit of a bumper crop for cucumbers this year.", "Bye Roksana"]

var roksanaTextFarmerChange = ["Mr Krishi, what happened to your farm?", "I'm so sorry.", "Ummm, well, I uh... Is there anything I can do?", "Oh... um... sorry Mr Krishi.", "Bye."]
var farmerTextChange = ["Oh, it's been terrible Roksana. Disease everywhere, crops destroyed by pests. There's almost nothing left.", "Don't be silly. It's not your fault is it.", "Not unless you can go back in time and stop these diseases before they start.", "It's ok, bye Roksana."]



var roksanaTextFisher = ["Hello Mr Ilish, how's everythign going?", "So nothing 'unusual' has happened?", "Oh nothing, just checking. Gotta go. Bye Mr. Iliish."]
var fisherText = ["Oh, fine. Pretty average catch today.", "No, of course not. What do you mean?", "Goodbye, Roksana."]

var roksanaTextFisherChange = ["Oh... Oh.... What's that?", "That giant fish!", "But it's enormous!", "Oh, something is very wrong, I'd better check on the rest of the village.", "I'm not sure. Bye Mr Ilish."]
var fisherTextChange = ["What's what?", "Well I wouldn't say giant. Maybe even a little smaller than usual.", "Oh, I've seen much bigger; but this one will still feed the village once I mange to catch it.", "Are you okay? You're acting very strange.", "Bye, Roksana."]


var roksanaTextDoctor = ["Hello Doctor Rugi. How are things at the clinic? Everything normal?", "No, just checking.", "Oh, getting better I think.", "Oh yeah, I've told him to be more careful.", "I know, I'll keep an eye on him.", "Goodbye, Doctor Rugi."]
var doctorText = ["Yes, pretty much. Why? Is anything wrong?", "How's your Dad's cold?", "That's good to hear. Maybe I won't keep finding his tissues all over the place then.", "He'll go infecing the whole village if he doesn't clean up after himself.", "Well, I'd better get back to work. Goodbye Roksana."]

var roksanaTextDoctorChange = ["Doctor Rugi. Why are there so many patients? What's happening?", "Is this normal?", "Ermmm, not really. Was it bad?", "Yes, I'm fine thank you.", "Goodbye, Doctor Rugi."]
var doctorTextChange = ["Oh nothing out of the ordinary, just the usual dino-virus.", "Of course it is, you had it yourself last year, don't you remember?", "Well you were sick for a while but you're okay now aren't you?",  "Well, I'd better get back to work... a lot of sick people to see. Goodbye Roksana."]


var roksanaTextHome = ["Well, so far everything looks normal at home. Let's see how the rest of the village is doing..."]
var roksanaTextHomeChange = ["Oh no, look at our house? How could this have happened?", "I'd better see how the rest of the village is doing..."]

var roksanaTextFamily = ["Finally, I found you all. I'm going to make sure the rest of the village is still... 'normal'"]

var roksanaTextScientist = ["You again! I've had enough of time travel. You can have this iTime thing back!",  "Thanks, but I've got school tomorrow", "Like what????", "Ermmm... I'm not sure."]
var scientistText = ["Thank you. You are clearly a skilled time traveler. You manged to rescue your family without making any changes. I could do with your help.", "Something happens today that leads to the extinction of the human race.", "I don't know yet, that why I have to travel to the future to find out. Want to come?", "Well, it's your choice. You can go home and carry on with your life, or you can get into my time machine and save humanity."]

var roksanaTextScientistChange = ["You again! I've had enough of time travel. You can have this thing back!", "Why?", "Well, I didn't mean to.", "Who else have you done this to?", "I think you should find someone else.", "I can't go through all this again.", "Ok, how do I try again? Click on the iTime device?", "What? Why?", "What are you talking about?", "Wait...", "Oh he's gone again.", "Now what do I do? Click on the iTime device or just go home?" ]
var scientistTextChange = ["You might want to hang on that for a bit longer.", "Looks like you may have made some changes when you went back in time...", "That's what they all say.", "I'll tell you later but right now I need your help.", "No, it has to be you. But first you need to go back and resuce your family without making any changes to the past.", "Well it's your choice. If you decide to try again, meet me back here at the end.", "That's right.... oh a word of warning. If you decide to do that, you will have no memory of any of these events.", "It makes it easier for the programmers.", "Good luck Roksana, maybe I'll see you again soon!"]

var roksanaFamilyText = ["Finally, everyone is back. I'd better make sure the house is okay..."]

var people = {
	
	"roksanaFamily": roksanaFamilyText,
	
	"roksanaBanor": roksanaTextBanor,
	"roksanaBanorChange": roksanaTextBanorChange,
	"mrbanor": banorText,
	"mrbanorChange": banorTextChange,
	
	"roksanaFarmer": roksanaTextFarmer,
	"roksanaFarmerChange": roksanaTextFarmerChange,	
	"mrkrishi": farmerText,
	"mrkrishiChange": farmerTextChange,
	
	"roksanaFisher": roksanaTextFisher,
	"mrilish": fisherText,
	"roksanaFisherChange": roksanaTextFisherChange,
	"mrilishChange": fisherTextChange,
	
	"roksanaDoctor": roksanaTextDoctor,
	"drrugi": doctorText,
	"roksanaDoctorChange": roksanaTextDoctorChange,
	"drrugiChange": doctorTextChange,
		
	"roksanaHome": roksanaTextHome,
	"roksanaHomeChange": roksanaTextHomeChange,
	
	"scientist": scientistText,	
	"roksanaScientist": roksanaTextScientist,
	"scientistChange": scientistTextChange,	
	"roksanaScientistChange": roksanaTextScientistChange
}


