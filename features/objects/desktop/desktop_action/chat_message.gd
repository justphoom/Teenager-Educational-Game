extends Control

@export var message : String = ""

@onready var text = %Message

func _ready() -> void:
	text = message
