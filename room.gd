class_name Room
extends Node2D

enum Type { NORMAL, KEY, EXIT }

var directions: Dictionary
var type: Type

@onready var endGround := $EndGround
@onready var backGround := $BackGround
@onready var backCeiling := $BackCeiling
@onready var foreGround := $ForeGround
@onready var foreCeiling := $ForeCeiling

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
	endGround.modulate = color
	backGround.modulate = color
	backCeiling.modulate = color
	foreGround.modulate = color
	foreCeiling.modulate = color

	match type:
		Type.KEY:
			backCeiling.set_texture(chest_tres)
		Type.EXIT:
			backCeiling.set_texture(locked_tres)
