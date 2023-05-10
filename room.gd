class_name Room
extends Node2D

enum Type { NORMAL, KEY, EXIT }

var directions: Dictionary
var type: Type

@onready var sprites := {
	endGround = $EndGround,
	backGround = $BackGround,
	backCeiling = $BackCeiling,
	foreGround = $ForeGround,
	foreCeiling = $ForeCeiling,
	leftArrow = $LeftArrow,
	rightArrow = $RightArrow,
	upArrow = $UpArrow,
	downArrow = $DownArrow,
}

@onready var chest_tres: AtlasTexture = preload("res://atlases/chest_0.tres")
@onready var locked_tres: AtlasTexture = preload("res://atlases/locked_0.tres")

func _init() -> void:
	directions = {
		left = randi() % 2 == 0,
		right = randi() % 2 == 0,
		forwards = randi() % 2 == 0,
		back = true
	}


func _ready() -> void:
	var color := Color(randf(), randf(), randf())

	for sprite in sprites.values():
		sprite.modulate = color


	if directions['left']:
		sprites['leftArrow'].modulate = Color.WHITE

	if directions['right']:
		sprites['rightArrow'].modulate = Color.WHITE

	if directions['forwards']:
		sprites['upArrow'].modulate = Color.WHITE

	if directions['back']:
		sprites['downArrow'].modulate = Color.WHITE


	match type:
		Type.KEY:
			sprites['backCeiling'].set_texture(chest_tres)
		Type.EXIT:
			sprites['backCeiling'].set_texture(locked_tres)
