extends Node

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	get_tree().paused = false
	pass

func _input(event):
	if(event.is_pressed()):
		GM.switchMainMenu()

#func _process(delta):
	
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
