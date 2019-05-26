extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var tutorailState = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	print("current level is: ", Save.Level)
	if (Save.Level == 0):
		$VBoxContainer/HBoxContainer/ColorRect2/VBoxContainer/Button_Continue.modulate = Color(0.2,0.2,0.2)
		$VBoxContainer/HBoxContainer/ColorRect2/VBoxContainer/Button_Continue.mouse_filter = Control.MOUSE_FILTER_IGNORE
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass





func _on_Button_Exit_pressed():
	get_tree().quit()


func _on_Button_NewGame_pressed():
	Save.Level = 0
	get_tree().change_scene("res://Scenes_and_Scripts/GameCore/GameState.tscn")


func _on_Button_Intro_pressed():
	get_tree().change_scene("res://Scenes_and_Scripts/Intro/Intro.tscn")


func _on_Button_Continue_pressed():
	get_tree().change_scene("res://Scenes_and_Scripts/GameCore/GameState.tscn")

#this block of code tkae care of tutorail cycling - quoted for menu node re arrengment
#func _on_TutorialTimeout_timeout():
#	match(tutorailState):
#		0:
#			$VBoxContainer/HBoxContainer/ColorRect3/Tutorial0.visible = false
#			$VBoxContainer/HBoxContainer/ColorRect3/Tutorial1.visible = true
#			tutorailState = 1
#			pass
#		1:
#			$VBoxContainer/HBoxContainer/ColorRect3/Tutorial1.visible = false
#			$VBoxContainer/HBoxContainer/ColorRect3/Tutorial2.visible = true
#			tutorailState = 2
#			pass
#		2:
#			$VBoxContainer/HBoxContainer/ColorRect3/Tutorial2.visible = false
#			$VBoxContainer/HBoxContainer/ColorRect3/Tutorial0.visible = true
#			tutorailState = 0
#			pass
#	pass




func _on_VolumeMasterSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master") ,value)


func _on_VolumeMusicSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music") ,value)


func _on_VolumeAmbientSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Effects") ,value)


func _on_VolumeEffectsSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Ambient") ,value)
