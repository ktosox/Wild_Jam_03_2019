extends Node

#changes GameStates
#tracks game progress
#does not do gameplay stuff
var currentLevel


func _ready():
	loadLevel(currentLevel)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func loadLevel(newLevel):
	pass
	

func resetLevel():
	#
	pass
	
func gameOver():
	#show game over screen
	pass

func changeLevel(newLevelNumber = Save.Level + 1):
	#change current level to newLevel
	#if no level provided goes to next level
	#pops current level
	var newLevel
	#stuff about loading level goes here
	
	currentLevel = newLevel
	pass