extends Node2D

var x_limit := 10
var y_limit := 10

@onready var map := create_map(x_limit, y_limit)

var pos := Vector2.ZERO :
	set (value):
		pos = value.clamp(Vector2.ZERO, Vector2(x_limit, y_limit))

var room_pks: PackedScene = preload("res://room.tscn")

func create_map(width: int, height: int) -> Array:
	var _map := []

	for x in range(width):
		var col := []
		_map.append(col)
		
		for y in range(height):
			col.append(room_pks.instantiate())

	return _map


func _ready() -> void:
	randomize()
	add_child(map[pos[0]][pos[1]])

#	var out := ''
#	for row in map:
#		for obj in row:
#			var room: Node2D = obj
#			out += '| %d ' % room.get_instance_id()
#		out += '|\n'
#	print(out)

func _process(delta: float) -> void:
	if Input.is_action_pressed('Left'):
		pos[0] -= 1
	if Input.is_action_pressed('Right'):
		pos[0] += 1
	if Input.is_action_pressed('Forwards'):
		pos[1] += 1
	if Input.is_action_pressed('Back'):
		pos[1] -=1
	print(pos)
