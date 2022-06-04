extends Node

var music_on = true

var currentLevel = 0

var plantsSquashed = 0

var tissues_collected = 0


var doctorChange = false
var fisherChange = false
var farmChange = false
var shopChange = false
var houseChange = true
var ufo = true

var science_changed = false;


var levels = ["res://Levels/BangladeshNow.tscn", "res://Levels/Level2/Level2.tscn", "res://Levels/Level3/Level3.tscn", "res://Levels/Level4/Level4.tscn", "res://Levels/TheEnd/BangladeshEnd.tscn"]
var canChangeLevel = false

var myInventory: Array = []

var current_action_object

var theBook = load("res://assets/Forest Objects/book.png")
var theFruit = load("res://assets/Dinosaur Objects/fruit_sample.png")
var theStick = load ("res://assets/Forest Objects/stick.png")
var theKey = load("res://assets/objects/key.png")
var theGrass = load("res://assets/objects/grass.png")
var iTime15 = load("res://assets/objects/itime15.png")
var thePhoto = load("res://assets/Bangladesh Objects/housetemp.jpeg")
var theGarlic = load("res://assets/Egypt/garlic.png")

func _ready():
	print ("Inv system autolad")

func add_to_inventory(object: String):
	myInventory.push_back(object)
	print (myInventory)
	


