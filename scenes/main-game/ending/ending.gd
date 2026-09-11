extends Node2D

func _ready() -> void:
	pass
	var texture
	#match Global.ENDING_TYPE:
		#1 : #good
			#texture  = preload("res://assets/CG-Scenes/Nerd ending.png")
			##song = preload("res://Assets/Audio/Music/[Academic Ending] Classic Nerdy.wav")
		#2 : #nerd
			#texture  = preload("res://assets/CG-Scenes/Good Ending.png")
			##song = preload("res://Assets/Audio/Music/Main Theme Rhythm.wav")
		#3 : #activist
			#texture  = preload("res://assets/CG-Scenes/Activist Ending.png")
			##song = preload("res://Assets/Audio/Music/[Activist Ending] Coltrane's Change.wav")
		#4 : #pregnance
			#texture  = preload("res://assets/CG-Scenes/Pregnant Ending.png")
			##song = preload("res://Assets/Audio/Music/[Pregnancy Ending] Pregnancy.wav")
		#5 : #kidnapping
			#texture  = preload("res://assets/CG-Scenes/Kidnapping Ending.png")
			##song = preload("res://Assets/Audio/Music/[Kidnapping Ending]F-Phrygian riff.wav")
		#_ :
			#texture  = preload("res://assets/CG-Scenes/Good Ending.png")
			##song = preload("res://Assets/Audio/Music/Main Theme Rhythm.wav")
	#$Background.texture = texture
	##bgmSound.stream = song

func _on_back_to_main_pressed() -> void:
	PlayerStatus.resetStats()
	get_tree().change_scene_to_file("res://landing-scences/landing.tscn")
