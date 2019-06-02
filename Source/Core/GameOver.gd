extends Control

func _on_Restart_pressed():
	get_tree().paused = false
	GM.resetLevel()

func _on_MainMenu_pressed():
	get_tree().paused = false
	GM.switchMainMenu()

func _on_Quit_pressed():
	GM.endGame()
