extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$ColorLayer.setColor(Color(1,0,0))
	$ColorLayer2.setColor(Color(0,1,0))
	$ColorLayer3.setColor(Color(0,0,1))
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

