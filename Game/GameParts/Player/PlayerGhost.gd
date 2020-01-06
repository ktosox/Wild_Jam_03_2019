extends RigidBody2D

var lockSpeed = 360
var followSpeed = 500
var velocity = 120
var resizeSpeed = 2
var hauntPosition = Vector2(500,500)
var isDragged = false
var isHaunting = false
var isSelected = false

func _ready():
	hauntPosition = position

func _process(delta):
	if(isDragged):
		var direciton = get_global_mouse_position() - $Head.global_position
		$Head.linear_velocity=( direciton.clamped(velocity)  * (followSpeed * delta))
	elif(isHaunting):
		$Head.linear_velocity=((hauntPosition - position) / (lockSpeed * delta))

func _input(event):
	if(event.is_action_released("LMB") and isDragged):
		isDragged = false
	if(event.is_action_pressed("LMB") and isSelected):
		isDragged = true
		isSelected = false



func _on_Head_mouse_entered():
	print("test")
	if(!isDragged):
		isSelected = true
	pass # Replace with function body.


func _on_Head_mouse_exited():
	isSelected = false
	pass # Replace with function body.