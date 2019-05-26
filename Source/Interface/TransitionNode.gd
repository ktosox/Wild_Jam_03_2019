extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var isOpen = true
var fadeSpeed = 0.8

func _ready():
	$ColorRect.color.a = 1
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if(!isOpen and $ColorRect.color.a < 1):
		$ColorRect.color.a  += delta * fadeSpeed
	elif($ColorRect.color.a > 0):
		$ColorRect.color.a  -= delta * fadeSpeed
	pass

func open():
	isOpen = true
	
	
func close():
	isOpen = false
