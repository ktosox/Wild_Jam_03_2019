extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var followMouse = false
var slowDownRate = 7000

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _input(event):
	if(event.is_class("InputEventMouseButton")):
		if(event.is_pressed()):
			followMouse = true
		else:
			followMouse = false

func _process(delta):
	if(followMouse):
		var distance = get_global_mouse_position() - position
		linear_velocity = distance + distance/0.6
	else:
		linear_velocity = linear_velocity * ( (slowDownRate * delta) / (1 + (slowDownRate * delta)) )
		#apply_impulse(Vector2(),direction*delta)
	pass

