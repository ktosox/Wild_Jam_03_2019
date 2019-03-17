extends RigidBody2D

var followMouse = false
var slowDownRate = 1
var followSpeed = 50

func _ready():
	$Trail.visible = false
	$Trail2.visible = false
	$SpawnDelay.start()

func _process(delta):
	if(followMouse):
		var direction = (get_global_mouse_position() - position)
		linear_velocity =  direction * (followSpeed * delta)
	else:
		linear_velocity = Vector2()

func _on_SpawnDelay_timeout():
	$Trail.visible = true
	$Trail2.visible = true
	followMouse = true
	$SpawnAnimation.emitting = true
	$SpawnAnimation.restart()