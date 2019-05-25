extends Node

#changes GameStates
#tracks game progress, maybe?
#does not do gameplay stuff


func _ready():
	loadLevel()
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func loadLevel():
	get_tree().change_scene("res://Scenes_and_Scripts/GameCore/GameState.tscn")
	#Save.Level
	pass
	

func resetLevel():
	#
	pass
	
func gameOver():
	#show game over screen
	pass
