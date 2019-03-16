extends Node

#defualt game state

#used by all levels for gameplay stuff

var myLevel # 
var myManager
var activeLayer 
var layerHolder

var gameMode = 0 # 0 for mosue control / 1 for keyboard control



func _ready():
	layerHolder = $GameLayerHolder
	switchActiveLayer("red")

func _process(delta):

	pass



func _input(event):
	if(gameMode):
		#ghost mode stuff
		pass
	else:
		#base mode stuff
		pass
	#if(event.is_class("InputEventMouseButton") and event.is_pressed()):
	#	if(event.button_index == 1): #follow on left mouse button click
	#		followMouse = true
	#	elif(event.button_index == 2): # stop following on right button click
	#		followMouse = false

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
