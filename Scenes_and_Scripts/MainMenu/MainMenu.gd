extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var tutorailState = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	if (CurrentLevel.level == 0):
		$VBoxContainer/HBoxContainer/ColorRect2/VBoxContainer/Button_Continue.modulate = Color(0.2,0.2,0.2)
		$VBoxContainer/HBoxContainer/ColorRect2/VBoxContainer/Button_Continue.mouse_filter = Control.MOUSE_FILTER_IGNORE
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass





func _on_Button_Exit_pressed():
	get_tree().quit()


func _on_Button_NewGame_pressed():
	CurrentLevel.level = 0
	get_tree().change_scene("res://Scenes_and_Scripts/GameCore/GameScene.tscn")


func _on_Button_Intro_pressed():
	get_tree().change_scene("res://Scenes_and_Scripts/Intro/Intro.tscn")


func _on_Button_Continue_pressed():
	if(CurrentLevel.level < 10):
		CurrentLevel.level = 0
	elif(CurrentLevel.level < 20):
		CurrentLevel.level = 10
	else:
		CurrentLevel.level = 20
	get_tree().change_scene("res://Scenes_and_Scripts/GameCore/GameScene.tscn")


func _on_TutorialTimeout_timeout():
	match(tutorailState):
		0:
			$VBoxContainer/HBoxContainer/ColorRect3/Tutorial0.visible = false
			$VBoxContainer/HBoxContainer/ColorRect3/Tutorial1.visible = true
			tutorailState = 1
			pass
		1:
			$VBoxContainer/HBoxContainer/ColorRect3/Tutorial1.visible = false
			$VBoxContainer/HBoxContainer/ColorRect3/Tutorial2.visible = true
			tutorailState = 2
			pass
		2:
			$VBoxContainer/HBoxContainer/ColorRect3/Tutorial2.visible = false
			$VBoxContainer/HBoxContainer/ColorRect3/Tutorial0.visible = true
			tutorailState = 0
			pass
	pass # replace with function body
