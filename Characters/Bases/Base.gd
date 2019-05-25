extends Node2D


var parentGameState
var childBase

var buttonMatrixRandom = [8,6,2,5,3,9,0,11,10,1,4,7] # numbers from 0 to 11 sorted randomly
var buttonMatrixList = [81,87,69,82,65,83,68,70,90,88,67,86]
var buttonMatrixMap = {}



func _ready():
	assignButtons()
	pass

#func _process(delta):

#	pass

func assignButtons():
	#connects specific buttons to actions
	for i in range(12):
		buttonMatrixMap[buttonMatrixList[i]] =  buttonMatrixRandom[i]

func processInput(buttonPressed):
	parentGameState.processBaseOutput(buttonMatrixMap[buttonPressed.get_scancode()])


func hauYes():
	$PossesionParticles.emitting = true
	pass

func hauNot():
	$PossesionParticles.emitting = false
	pass

func _on_BaseArea_body_entered(body):
	if(body == parentGameState.player):
		hauYes()
		parentGameState.startPosses(self)

func _on_BaseArea_body_exited(body):
	if(body == parentGameState.player):
		hauNot()
	pass
