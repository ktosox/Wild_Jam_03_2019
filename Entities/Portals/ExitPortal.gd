extends Node2D


var parentGameState

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Area2D_body_entered(body):
	parentGameState.lockPlayer(position)
	parentGameState.gameWon()
	pass 
