extends Node

#defualt game state

#used by all levels for gameplay stuff

var gameMenu = load("res://Source/Core/GameMenu.tscn") #ingame menu scene
var gameOver = load("res://Source/Core/GameOver.tscn") #gameover screen scene
var playerBase = load("res://Entities/Player/PlayerGhost.tscn") #the source class for the player class
var levelLayout #to be set at start
var player # the player controlled ghost entity
var currentBase # the current base accepting input and holding player

#bellow is very much depriciated
#var listOfBaseButtons = [81,87,69,82,65,83,68,70,90,88,67,86] #used to avoid errors while based is accepting input

var activeLayer 
var myLevelLayout #this gamestate's level layout - depends on level

var gameMode = 0 # 0 for mosue control / 1 for keyboard control



func _ready():
	startState()
	get_tree().paused = false

	setLayout()
	myLevelLayout = levelLayout.instance()
	add_child_below_node($ScreenEdge,myLevelLayout)
	switchActiveLayer("red")
	

#func _process(delta):
#	pass

func _input(event):
	if(event.is_action("ui_cancel")):
		openGameMenu()
		get_tree().set_input_as_handled()
	if(gameMode==0):
	#ghost mode stuff
		if(event.is_class("InputEventMouseButton") and event.is_pressed()):
			if(event.button_index == 1): #follow on left mouse button click
				player.followMouse = true
			elif(event.button_index == 2): # stop following on right button click
				player.followMouse = false
	else:
	#base mode stuff
		pass
		#to be impleneted
#		if(event.is_class("InputEventKey") and event.is_pressed()):
#			if(listOfBaseButtons.has(event.get_scancode())):
#				currentBase.processInput(event)
#			else:
#				print("button was wrong")

#Interface function for communicating with in game objects
#accepts type of acction and optional parameter
func gameAction(ActionType, ActionValue = null):
	match(ActionType):
		0:
			#Player enterd a hauntable object
			pass
		1:
			pass
		2:
			pass
		3:
			pass
		_:
			print("I exepcted an ActionType, and all I got is this crap: >",ActionType,"< , what am I suppose to do with this?")
	pass

#this needs to change
func switchGameMode():
	if(gameMode):
		gameMode = 0
		#switch to base mode
		pass
	else:
		gameMode = 1
		#switch to ghost mode
		pass
	print("gamemode: ",gameMode," is now active")

#starts possesion mode
func startPosses(callingBase):
	currentBase = callingBase
	switchGameMode()
	lockPlayer(callingBase.global_position)

#ends possesion mode
func stopPosses():
	switchGameMode()
	unlockPlayer()

#loads the appropriet level layout
func setLayout():
	match(GM.Level):
		0:
			levelLayout = preload("res://Levels/0/LevelLayout.tscn")
		1:
			levelLayout = preload("res://Levels/1/LevelLayout.tscn")
		2:
			levelLayout = preload("res://Levels/2/LevelLayout.tscn")
		_:
			print("the current level is ",GM.Level," and I dont know what to do about it, so fuck you - Im loading the tutorial, LOL")
			levelLayout = preload("res://Levels/0/LevelLayout.tscn")

#func processBaseOutput(command):
#	print ("command from base recieved: ", command)
#	if(command == 6):
#		stopPosses()
#	# called by base to process stuff caused by button press
#	pass

#this makes the color change
func switchActiveLayer(newLayer):
	myLevelLayout.setActiveLayer(newLayer)
	pass

#this makes the ghost disapper on haunt
func lockPlayer(lockPosition):
	player.followMouse = false
	player.restLocation = lockPosition
	pass

#this puts the ghost back at haunt end
func unlockPlayer():
	player.followMouse = true
	pass

#spawns the player ghost
func spawnPlayer():
	player = playerBase.instance()
	add_child(player)

#triggered on achiving victory condition
func gameWon():
	
	pass

#triggered on game loss
func gameLost():
	var lostScreen = gameOver.instance()
	self.add_child(lostScreen, true)
	get_tree().paused = true

#opens the in game mini menu window
func openGameMenu():
	var pauseMenu = gameMenu.instance()
	self.add_child(pauseMenu, true)
	get_tree().paused = true
	pass

#stuff before fadein
func startState():
	#load stuff like LL
	$FadeInTimer.start()
	pass

func endState():
	#clean up
	pass

func _on_FadeInTimer_timeout():
	#triggered once screen stops fading in, 
	#stuff that starts after screen stops fading in goes here
	spawnPlayer()
	pass

func _on_FadeOutTimer_timeout():
	#triggered once screen fades to black
	#next level stuff goes here
	endState()
	pass 
