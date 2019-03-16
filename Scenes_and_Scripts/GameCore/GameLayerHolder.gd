extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$LayerRed.setColor(Color(1,0,0))
	$LayerGreen.setColor(Color(0,1,0))
	$LayerBlue.setColor(Color(0,0,1))
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func setActiveLayer(color):
	match color:
		"red" :
			$LayerBlue.deActivateLayer()
			$LayerGreen.deActivateLayer()
			$LayerRed.activateLayer()
			pass
		"green" :
			$LayerBlue.deActivateLayer()
			$LayerRed.deActivateLayer()
			$LayerGreen.activateLayer()
			pass
		"blue" :
			$LayerRed.deActivateLayer()
			$LayerGreen.deActivateLayer()
			$LayerBlue.activateLayer()
			pass