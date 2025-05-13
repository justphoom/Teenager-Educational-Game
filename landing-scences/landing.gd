extends Node2D


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://landing-scences/character_selection.tscn")

func _on_credit_pressed() -> void:
	get_tree().change_scene_to_file("res://landing-scences/credit_scene.tscn")
