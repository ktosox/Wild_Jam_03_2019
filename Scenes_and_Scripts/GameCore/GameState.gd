extends Node

#defualt game state

#used by all levels for gameplay stuff

var gameMenu = load("res://Scenes_and_Scripts/GameCore/GameMenu.tscn")
var gameOver = load("res://Scenes_and_Scripts/GameCore/GameOver.tscn")
var playerBase = load("res://Scenes_and_Scripts/Player/PlayerGhost.tscn")
var player


var myLevel # 
var myManager
var activeLayer 
var layerHolder

var gameMode = 0 # 0 for mosue control / 1 for keyboard control



func _ready():
	get_tree().paused = false
	$FadeInTimer.start()
	$GenericBase.setParent(self)
	$ExitPortal.parentGameState = self
	layerHolder = $GameLayerHolder
	switchActiveLayer("red")
	

func _process(delta):

	pass



func _input(event):
	if(event.is_action("ui_cancel")):
		openGameMenu()
#	if(gameMode):
#		#ghost mode stuff
#		pass
#	else:
#		#base mode stuff
#		pass
#	#if(event.is_class("InputEventMouseButton") and event.is_pressed()):
#	#	if(event.button_index == 1): #follow on left mouse button click
#	#		followMouse = true
#	#	elif(event.button_index == 2): # stop following on right button click
#	#		followMouse = false

func switchGameMode():
	if(gameMode):
		#switch to base mode
		pass
	else:
		#switch to ghost mode
		pass
	pass


func switchActiveLayer(newLayer):
	layerHolder.setActiveLayer(newLayer)
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
	
func startPortal():
	
	pass

func gameWon():
	$WinTimer.start()
	pass

func openGameMenu():
	var pauseMenu = gameMenu.instance()
	self.add_child(pauseMenu, true)
	get_tree().paused = true
	pass

func gameLost():
	var lostScreen = gameOver.instance()
	self.add_child(lostScreen, true)
	get_tree().paused = true


func _on_wonDelay_timeout():
	myManager.changeLevel()
	pass


func _on_lostDelay_timeout():
	if (Save.lifes > 0):
		myManager.resetLevel()
	else:
		myManager.gameOver()
	myManager.rest
	pass


func _on_FadeInTimer_timeout():
	spawnPlayer()
	pass # Replace with function body.
