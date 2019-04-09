extends RigidBody2D

var followMouse = false
var lockSpeed = 30
var followSpeed = 50
var resizeSpeed = 2
var restLocation = Vector2(500,500)

func _ready():
	restLocation = position
	$Trail.visible = false
	$Trail2.visible = false
	$SpawnDelay.start()

func _process(delta):
	if(followMouse):
		if($Trail2.modulate.a<1.0):
			$Trail2.modulate.a+=delta * resizeSpeed
		linear_velocity =  (get_global_mouse_position() - position) * (followSpeed * delta)
	else:
		linear_velocity = (restLocation - position) / (lockSpeed * delta)
		if($Trail2.modulate.a>0.1):
			$Trail2.modulate.a-=delta * resizeSpeed


func _on_SpawnDelay_timeout():
	$Trail.visible = true
	$Trail2.visible = true
	followMouse = true
	$SpawnAnimation.emitting = true
	$SpawnAnimation.restart()