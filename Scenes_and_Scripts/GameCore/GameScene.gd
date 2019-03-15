extends Node

var gameMenu = load("res://Scenes_and_Scripts/GameCore/GameMenu.tscn")
var gameOver = load("res://Scenes_and_Scripts/GameCore/GameOver.tscn")
var playerBase = load("res://Scenes_and_Scripts/Player/PlayerGhost.tscn")

var player

func _ready():
	get_tree().paused = false
	$FadeInTimer.start()
	$GenericBase.setParent(self)


func _input(event):
	if(event.is_action("ui_cancel")):
		openGameMenu()

#func _process(delta):
#	pass

func hauntStarted(base):
	base.hauYes()
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
	$NextLevel.start()
	pass # replace with function body


func _on_NextLevel_timeout():
	openGameMenu()
	pass # replace with function body


func _on_FadeInTimer_timeout():
	spawnPlayer()

	#stuff after fade in ends
	pass 


func _on_FadeOutTimer_timeout():
	#stuff after screen turns black
	pass
