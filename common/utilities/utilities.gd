extends Node

func load_component(component_path : String) -> void:
	add_child(load(component_path).instantiate())
