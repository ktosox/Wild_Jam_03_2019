extends Node

#defualt game state

#used by all levels for gameplay stuff

var myLevel # 
var myManager



func _ready():

	pass


#func _process(delta):

#	pass


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
