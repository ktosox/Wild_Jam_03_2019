extends Area2D


var active = true

func _ready():

	pass



func _on_HauntArea_body_entered(body):
	if(active):
		body.start_haunt()
		get_parent()._haunted()
	pass
