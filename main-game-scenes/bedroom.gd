extends Node2D

@onready var deskAnimation = $Object/DeskObject/DeskItem/AnimationPlayer
@onready var bedAnimation = $Object/BedObject/BedItem/AnimationPlayer
@onready var tutorialItem = $Object/Tutorial/TutorialItem/AnimationPlayer

func _ready() -> void:
	deskAnimation.play("DeskItemAnimation")
	bedAnimation.play("BedAnimation")
	tutorialItem.play("TutorialItem")
	
	#DialogueManager.show_dialogue_balloon(load('res://dialogues/Test.dialogue'))

func _on_exit_body_entered(body: Node2D) -> void:
	if PlayerStatus.gameCycle == Global.maxCycle:
		DialogueManager.show_dialogue_balloon(load('res://dialogues/EndgameDialog.dialogue'))
	else:
		PlayerStatus.toMainroadFrom = "bedroom"
		get_tree().change_scene_to_file("res://main-game-scenes/mainroad.tscn")
