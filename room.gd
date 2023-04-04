class_name Room
extends Node2D

@onready var bg := $Background

var directions: Dictionary

func _init() -> void:
	directions = {
		left = randi() % 2 == 0,
		right = randi() % 2 == 0,
		forwards = randi() % 2 == 0,
		back = randi() % 2 == 0
	}

func _ready() -> void:
	bg.modulate = Color(randf(), randf(), randf())
