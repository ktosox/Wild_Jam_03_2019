extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	get_tree().paused = false
	pass

func _input(event):
	if(event.is_pressed()):
		get_tree().change_scene("res://Source/MainMenu/MainMenu.tscn")

#func _process(delta):
	
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
