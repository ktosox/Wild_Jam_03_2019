extends Node

#What this scene does:
# changes GameStates and manages switches betweeen intro / game /mainmenu
# tracks game progress - like current level and level progression
# manages game options like audio level brightnes etc.

#What is does not do:
# gameplay stuff - should not talk to any in game objects

#All the scene address should go here:
var GameState = "res://Source/Core/GameState.tscn"
var MainMenu = "res://Source/MainMenu/MainMenu.tscn"
var Intro = "res://Source/Intro/Intro.tscn"
#--------------------------------------

var Level

func _ready():
	Level = 1
	#always on ready go to intro
	#switchIntro()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func loadLevel():
	#loads the selected level
	print ("now starting Level: ", Level)
	get_tree().change_scene(GameState)
	#Save.Level
	pass
	
func updateProgress():
	#saves current level progress to an external file
	pass

func switchIntro():
	#switches the current scene to the intro
	get_tree().change_scene(Intro)
	pass

func switchMainMenu():
	#switches current scene to MainMenu
	get_tree().change_scene(MainMenu)
	pass

func resetLevel():
	#reloads current level
	pass
	

func endGame():
	#end games after quit button was presed
	get_tree().quit()
	pass