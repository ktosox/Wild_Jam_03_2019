extends Node2D


var parentGameState
var childBase

var buttonMatrixRandom = [8,6,2,5,3,9,0,11,10,1,4,7] # numbers from 0 to 11 sorted randomly
var buttonMatrixList = ["Q","W","E","R","A","S","D","F","Z","X","C","V"]
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
	match buttonMatrixMap[buttonPressed]:
		0:
			pass
		1:
			pass
		2:
			pass
	pass


func possesBase():
	pass

func leaveBase():
	pass

func hauYes():
	$PossesionParticles.emitting = true
	pass

func hauNot():
	$PossesionParticles.emitting = false
	pass

func _on_BaseArea_body_entered(body):
	if(body == parentGameState.player):
		parentGameState.hauntStarted(self)

