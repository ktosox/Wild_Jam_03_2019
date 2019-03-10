extends Node

var gameMenu = load("res://Scenes_and_Scripts/GameCore/GameMenu.tscn")
var gameOver = load("res://Scenes_and_Scripts/GameCore/GameOver.tscn")
#var playerBase = load("res://Scenes_and_Scripts/Player/WildcatScene.tscn")

var playerLife = 5
var playerShield = 10
var playerLazor = 80
var bumperShield = 100

var currentPlayer = null

func _ready():
	get_tree().paused = false
	spawnPlayer()

func _input(event):
	if(event.is_action("ui_cancel")):
		openGameMenu()

#func _process(delta):
#	pass

func spawnPlayer():
	pass
	#if(currentPlayer == null):
		#currentPlayer = playerBase.instance()
		#add_child(currentPlayer)
	

func progressGame():
	CurrentLevel.level += 1
	print("game level is: ", CurrentLevel.level)
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

func _on_EdgeOfScreen_body_exited(body):
	if(body.get_class() == "KinematicBody2D"):
		print("player died")
		gameLost()

func _on_OutsideOfGame_body_exited(body):
	if(body.get_class() == "RigidBody2D"):
		body.destroy()

func _on_Button_pressed():
	openGameMenu()


func _on_GameTimer_timeout():
	progressGame()


func _on_Button2_pressed():
	gameLost()

