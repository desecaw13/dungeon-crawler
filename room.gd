class_name Room
extends Node2D

var directions: Dictionary
var is_special: bool

@onready var bg := $Background
@onready var fg := $Foreground
@onready var cf := $Ceiling


func _init() -> void:
	directions = {
		left = randi() % 2 == 0,
		right = randi() % 2 == 0,
		forwards = randi() % 2 == 0,
		back = true
	}


func _ready() -> void:
	var color := Color(randf(), randf(), randf())
	bg.modulate = color
	fg.modulate = color
	cf.modulate = color
