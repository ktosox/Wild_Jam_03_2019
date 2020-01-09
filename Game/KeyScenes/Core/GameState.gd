extends Node

#defualt game state

#used by all levels for gameplay stuff

var gameMenu = load("res://Source/Core/GameMenu.tscn") #ingame menu scene
var gameOver = load("res://Source/Core/GameOver.tscn") #gameover screen scene
var playerBase = load("res://Entities/Player/PlayerGhost.tscn") #the source class for the player class
var levelLayout #to be set at start
var player # the player controlled ghost entity
var currentBase # the current base accepting input and holding player


var gameMode = 0 # 0 for mosue control / 1 for keyboard control



func _ready():
	get_tree().paused = false
	

#func _process(delta):
#	pass

func _input(event):
	if(event.is_action("ui_cancel")):
		openGameMenu()
		get_tree().set_input_as_handled()


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


#starts possesion mode
func startPosses(callingBase):
	currentBase = callingBase
	lockPlayer(callingBase.global_position)



#this makes the ghost disapper on haunt
func lockPlayer(lockPosition):
	player.followMouse = false
	player.restLocation = lockPosition
	pass


#spawns the player ghost
func spawnPlayer():
	player = playerBase.instance()
	add_child(player)


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

