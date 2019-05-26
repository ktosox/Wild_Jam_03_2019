extends Node

#defualt game state

#used by all levels for gameplay stuff

var gameMenu = load("res://Source/Core/GameMenu.tscn")
var gameOver = load("res://Source/Core/GameOver.tscn")
var playerBase = load("res://Entities/Player/PlayerGhost.tscn")
var levelLayout #to be set at start
var player # the player controlled ghost entity
var currentBase # the current base accepting input and holding player

var listOfBaseButtons = [81,87,69,82,65,83,68,70,90,88,67,86] #used to avoid errors while based is accepting input

var activeLayer 
var myLevelLayout #this gamestates level layout - depends on level

var gameMode = 0 # 0 for mosue control / 1 for keyboard control



func _ready():
	get_tree().paused = false
	$GenericBase.setParent(self)
	$FadeInTimer.start()
	$ExitPortal.parentGameState = self
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
		if(event.is_class("InputEventKey") and event.is_pressed()):
			if(listOfBaseButtons.has(event.get_scancode())):
				currentBase.processInput(event)
			else:
				print("button was wrong")


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

func startPosses(callingBase):
	currentBase = callingBase
	switchGameMode()
	lockPlayer(callingBase.global_position)

func stopPosses():
	switchGameMode()
	unlockPlayer()

func setLayout():
	match(Save.Level):
		0:
			levelLayout = preload("res://Levels/0/GameLayer.tscn")
		1:
			levelLayout = preload("res://Levels/1/GameLayer.tscn")
		2:
			levelLayout = preload("res://Levels/2/GameLayer.tscn")
		_:
			print("the current level is ",Save.Level," so fuck you, LOL")
			levelLayout = preload("res://Levels/0/GameLayer.tscn")

func processBaseOutput(command):
	print ("command from base recieved: ", command)
	if(command == 6):
		stopPosses()
	# called by base to process stuff caused by button press
	pass


func switchActiveLayer(newLayer):
	myLevelLayout.setActiveLayer(newLayer)
	pass

func lockPlayer(lockPosition):
	player.followMouse = false
	player.restLocation = lockPosition
	pass

func unlockPlayer():
	player.followMouse = true
	pass

func spawnPlayer():
	player = playerBase.instance()
	add_child(player)
	

func gameWon():
	#triggered on achiving victory condition
	pass

func gameLost():
	var lostScreen = gameOver.instance()
	self.add_child(lostScreen, true)
	get_tree().paused = true

func openGameMenu():
	var pauseMenu = gameMenu.instance()
	self.add_child(pauseMenu, true)
	get_tree().paused = true
	pass

func _on_FadeInTimer_timeout():
	#triggered once screen stops fading in, 
	#stuff that starts after screen stops fading in goes here
	spawnPlayer()
	pass

func _on_FadeOutTimer_timeout():
	#triggered once screen fades to black
	#next level stuff goes here
	pass 
