extends Control

func _on_Restart_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes_and_Scripts/GameCore/GameScene.tscn")

func _on_MainMenu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes_and_Scripts/MainMenu/MainMenu.tscn")

func _on_Quit_pressed():
	get_tree().quit()
