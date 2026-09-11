extends Node2D


func _on_start_pressed() -> void:
	ScenceTransition.change_scene("res://landing-scences/character_selection.tscn")

func _on_credit_pressed() -> void:
	Tutorial.is_tutorial_state = false
	Tutorial.isGetArchiveBook = true
	ScenceTransition.change_scene("res://main-game-scenes/bedroom.tscn")
