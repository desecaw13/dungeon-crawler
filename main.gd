extends Node2D

var x_limit := 10
var y_limit := 10

@onready var map := create_map(x_limit, y_limit)

var pos := Vector2.ZERO :
	set (value):
		pos = value.clamp(Vector2.ZERO, Vector2(x_limit - 1, y_limit - 1))

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
	move()
	print(pos)

func move() -> void:
	if Input.is_action_just_pressed('Left'):
		remove_child(map[pos[0]][pos[1]])
		pos[0] -= 1
		add_child(map[pos[0]][pos[1]])
	if Input.is_action_just_pressed('Right'):
		remove_child(map[pos[0]][pos[1]])
		pos[0] += 1
		add_child(map[pos[0]][pos[1]])
	if Input.is_action_just_pressed('Forwards'):
		remove_child(map[pos[0]][pos[1]])
		pos[1] += 1
		add_child(map[pos[0]][pos[1]])
	if Input.is_action_just_pressed('Back'):
		remove_child(map[pos[0]][pos[1]])
		pos[1] -=1
		add_child(map[pos[0]][pos[1]])
