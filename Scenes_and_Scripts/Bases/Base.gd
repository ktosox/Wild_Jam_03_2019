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
	match buttonMatrixMap[buttonPressed.get_scancode()]:
		0:
			parentGameState.switchActiveLayer("green")
			pass
		1:
			print(1)
			parentGameState.switchActiveLayer("red")
			pass
		2:
			parentGameState.switchActiveLayer("blue")
			print(2)
			pass
		3:
			print(3)
			pass
		4:
			print(4)
			pass
		5:
			print(5)
			pass
		6:
			print(6)
			pass
		7:
			print(7)
			pass
		8:
			print(8)
			pass
		9:
			print(9)
			pass
		10:
			print(10)
			pass
		11:
			print(11)
			pass
		_:
			pass
	pass






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
	pass # Replace with function body.
