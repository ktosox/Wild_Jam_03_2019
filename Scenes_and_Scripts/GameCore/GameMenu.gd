extends Control

func _on_Button_return_pressed():
	get_tree().paused = false
	self.queue_free()


func _on_Button_moar_pressed():
	print("MOAR MOAR MOARMOAR MOAR MOAR MOAR")


func _on_Button_exit_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes_and_Scripts/MainMenu/MainMenu.tscn")
