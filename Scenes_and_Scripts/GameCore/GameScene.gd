extends Node

var gameMenu = load("res://Scenes_and_Scripts/GameCore/GameMenu.tscn")
var gameOver = load("res://Scenes_and_Scripts/GameCore/GameOver.tscn")
var playerBase = load("res://Scenes_and_Scripts/Player/PlayerGhost.tscn")
var layerHolder
var player

func _ready():
	get_tree().paused = false
	$FadeInTimer.start()
	$GenericBase.setParent(self)
	$ExitPortal.parentGameState = self
	layerHolder = $GameLayerHolder
	switchActiveLayer("red")


func _input(event):
	if(event.is_action("ui_cancel")):
		openGameMenu()

#func _process(delta):
#	pass

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


func _on_Button_pressed():
	openGameMenu()
	

func _on_Button2_pressed():
	gameLost()



func _on_WinTimer_timeout():

	pass # replace with function body



func _on_FadeInTimer_timeout():
	spawnPlayer()

	#stuff after fade in ends
	pass 


func _on_FadeOutTimer_timeout():
	#stuff after screen turns black
	pass


func _on_Button3_pressed():
	unlockPlayer()
	pass # Replace with function body.


func _on_Button5_pressed():
	switchActiveLayer("green")
	pass # Replace with function body.


func _on_Button4_pressed():
	switchActiveLayer("blue")
	pass # Replace with function body.
