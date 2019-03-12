extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var followMouse = false
var slowDownRate = 7000
var followSpeed = 50

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _input(event):
	if(event.is_class("InputEventMouseButton") and event.is_pressed()):
		if(event.button_index == 1): #follow on left mouse button click
			followMouse = true
		elif(event.button_index == 2): # stop following on right button click
			followMouse = false

func _process(delta):
	if(followMouse):
		var direction = (get_global_mouse_position() - position)
		linear_velocity =  direction * (followSpeed * delta)
	else:
		linear_velocity = linear_velocity * ( (slowDownRate * delta) / (1 + (slowDownRate * delta)) )
		#apply_impulse(Vector2(),direction*delta)
	pass

