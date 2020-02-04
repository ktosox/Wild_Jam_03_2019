extends RigidBody2D

var followSpeed = 700
var velocity = 60
var resizeSpeed = 2
var isDragged = false
var isHaunting = false
var isSelected = false

func _ready():
	GM.playerGhost = self
	pass

func _exit_tree():
	GM.ghost_mode_ended(isHaunting)
	pass

func _process(delta):
	if(isDragged):
		var direciton = get_global_mouse_position() - $Head.global_position
		$Head.linear_velocity=( direciton.clamped(velocity)  * (followSpeed * delta))
		$Head/orb3/AnimationPlayer.stop()

func _input(event):
	if(event.is_action_released("LMB") and isDragged):
		isDragged = false
		$Head/orb3/AnimationPlayer.play("loop")
	if(event.is_action_pressed("LMB") and isSelected):
		isDragged = true
		isSelected = false



func start_haunt():
	isDragged = false
	isHaunting = true

	$Head.linear_velocity = Vector2()
	$Spawn.play("Stop")
	pass

func _on_Head_mouse_entered():
	#print("test")
	if(!isDragged):
		isSelected = true


func _on_Head_mouse_exited():
	isSelected = false

	
	
