extends TileMap

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var spawnScene = load("res://GameParts/Portals/SpawnPlatform.tscn")
var exitScene = load("res://GameParts/Portals/ExitPortal.tscn")
var clockScene
var darknessScene


func _ready():
	load_level()
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
					print("exit at ",x," ",y)
				4:
					var newSpawn = spawnScene.instance()
					newSpawn.global_position = map_to_world(Vector2(x,y))
					add_child(newSpawn)
	#replace extra tiles with the correpsonding objects
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