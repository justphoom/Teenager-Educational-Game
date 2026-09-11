extends Node2D

@onready var classroomPortal = $ClassroomPortal
@onready var classroomPortal_glow = $ClassroomPortal/GlowingSpot_Classroom
var isClassroomPortalHide : bool

@onready var portalScound = $PortalSound

func _ready() -> void:
	var initPosition: Vector2 = Vector2(150, 900)
	$Player.set_position(initPosition)
	hide_classrrom()
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day1/day1-mainroad-1.dialogue"))

func _on_classroom_portal_body_entered(_body: Node2D) -> void:
	if !isClassroomPortalHide:
		portalScound.play()
		await get_tree().create_timer(Global.exitDelay).timeout
		ScenceTransition.change_scene("res://tutorial-scenes/day-1/tutorial_day_1_classroom_1.tscn")

func hide_classrrom() -> void:
	isClassroomPortalHide = true
	classroomPortal.hide()
	
func show_classroom() -> void:
	print("show classroom")
	isClassroomPortalHide = false
	classroomPortal.show()
	classroomPortal_glow.setType(2)
