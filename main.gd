extends Node2D

var x_limit := 10
var y_limit := 10

@onready var map := create_map(x_limit, y_limit)

var pos := Vector2.ZERO :
	set (value):
		if value.x < 0:
			value.x = x_limit - 1
		elif value.x >= x_limit:
			value.x = 0

		if value.y < 0:
			value.y = y_limit - 1
		elif value.y >= y_limit:
			value.y = 0

		pos = value#.clamp(Vector2.ZERO, Vector2(x_limit - 1, y_limit - 1))

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
	add_child(map[pos.x][pos.y])

#	var out := ''
#	for row in map:
#		for obj in row:
#			var room: Node2D = obj
#			out += '| %d ' % room.get_instance_id()
#		out += '|\n'
#	print(out)

func _process(delta: float) -> void:
	move()
	print(map[pos.x][pos.y].directions)
	print(pos)

func move() -> void:
	if (
			Input.is_action_just_pressed('Left')
			and map[pos.x][pos.y].directions.left
	):
		remove_child(map[pos.x][pos.y])
		pos.x -= 1
		add_child(map[pos.x][pos.y])

	if (
			Input.is_action_just_pressed('Right')
			and map[pos.x][pos.y].directions.right
	):
		remove_child(map[pos.x][pos.y])
		pos.x += 1
		add_child(map[pos.x][pos.y])

	if (
			Input.is_action_just_pressed('Forwards')
			and map[pos.x][pos.y].directions.forwards
	):
		remove_child(map[pos.x][pos.y])
		pos.y += 1
		add_child(map[pos.x][pos.y])

	if (
			Input.is_action_just_pressed('Back')
			and map[pos.x][pos.y].directions.back
	):
		remove_child(map[pos.x][pos.y])
		pos.y -=1
		add_child(map[pos.x][pos.y])
