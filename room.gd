extends Node2D

@onready var bg := $Background

var directions = {left = true, right = true, forwards = true, back = true}

func _ready():
	bg.modulate = Color(randf(), randf(), randf())
