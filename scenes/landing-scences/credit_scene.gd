extends Node2D


func _on_back_to_main_pressed() -> void:
	get_tree().change_scene_to_file("res://landing-scences/landing.tscn")
