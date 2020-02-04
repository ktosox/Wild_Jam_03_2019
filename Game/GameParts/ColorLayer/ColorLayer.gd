extends TileMap

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var spawnScene = load("res://GameParts/Portals/SpawnPlatform.tscn")
var exitScene = load("res://GameParts/Portals/ExitPortal.tscn")
var clockScene
var darknessScene

var currentLayer

func _ready():
	load_level()
	GM.currentLevel = self
	turn_off_colision(1)
	currentLayer =1
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func load_level():
	for x in 37 :
		for y in 20 :
			match (get_cell(x,y)):
				6:
					print("clock at ",x," ",y)
				5:
					var newExit = exitScene.instance()
					newExit.global_position = map_to_world(Vector2(x,y))
					add_child(newExit)
					set_cell(x,y,-1)
				4:
					var newSpawn = spawnScene.instance()
					newSpawn.global_position = map_to_world(Vector2(x,y))
					add_child(newSpawn)
					set_cell(x,y,-1)
	#replace extra tiles with the correpsonding objects
	pass

func change_layer(newLayer):
	turn_on_colision(currentLayer)
	currentLayer = newLayer
	turn_off_colision(newLayer)
	pass

func turn_off_colision(layer : int):
	if(layer<0 or layer>2):
		print("error, worng layer")
		return
	for x in tile_set.tile_get_shape_count(layer) :
		tile_set.tile_set_shape_offset(layer,x,Vector2(0,4000))
	pass

func turn_on_colision(layer : int):
	if(layer<0 or layer>2):
		print("error, worng layer")
		return
	for x in tile_set.tile_get_shape_count(layer) :
		tile_set.tile_set_shape_offset(layer,x,Vector2(0,0))
	pass


func _on_red_pressed():
	GM.currentLevel.change_layer(0)
	pass # Replace with function body.


func _on_green_pressed():
	GM.currentLevel.change_layer(2)
	pass # Replace with function body.


func _on_bkue_pressed():
	GM.currentLevel.change_layer(1)
	pass # Replace with function body.
