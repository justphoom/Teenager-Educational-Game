extends CharacterBody2D

const SPEED = 320

@onready var joystick = $Joystick/Joycon
@onready var animChar = $PlayerCharacter
@onready var interactButton = $Joystick/Interact
@onready var statusTab = $StatusTab

var prev_move : Vector2 = Vector2(0, 0)

var isShowStatus : bool = false
var isHitItem : bool = false
var itemName : String = ""

func _ready():
	statusTab.hide()
	interactButton.hide()
	if PlayerStatus.playerGender == 'BOY':
		animChar.play("boy_down")
	elif PlayerStatus.playerGender == 'GIRL':
		animChar.play("girl_down")

func _physics_process(delta: float) -> void:
	var input_direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	velocity = input_direction * SPEED	
	if joystick.touched :
		var direction = joystick.posVector
		if direction:
			velocity = direction * SPEED
			if direction.x >= 0.3:
				direction.x = 1
			elif direction.x <= -0.3:
				direction.x = -1
			else:
				direction.x = 0
				
			if direction.y >= 0.3:
				direction.y = 1
			elif direction.y <= -0.3:
				direction.y = -1
			else:
				direction.y = 0
			if PlayerStatus.isOpenDialog != true:
				update_animation_parameters_touch(direction, PlayerStatus.playerGender)
		else:
			velocity = Vector2(0,0)
	else:
		if PlayerStatus.isOpenDialog != true:
			update_animation_parameters(input_direction, PlayerStatus.playerGender)
	if PlayerStatus.isOpenDialog == true:
		velocity = Vector2(0,0)
	var playerMove =  move_and_collide(velocity*delta)
	if playerMove:
		pass
		#if playerMove.get_collider().name :
			#print(playerMove.get_collider().name )
			#self.showInteractButton()

func update_animation_parameters(move_input : Vector2, type : String):
	if(move_input != Vector2.ZERO):
		match move_input :
			Vector2(0,1) :
				if (type == 'BOY'):
					animChar.play("boy_down_move")
				elif (type == 'GIRL'):
					animChar.play("girl_down_move")
			Vector2(0,-1) :
				if (type == 'BOY'):
					animChar.play("boy_up_move")
				elif (type == 'GIRL'):
					animChar.play("girl_up_move")
			Vector2(1,0) :
				if (type == 'BOY'):
					animChar.play("boy_right_move")
				elif (type == 'GIRL'):
					animChar.play("girl_right_move")
			Vector2(-1,0) :
				if (type == 'BOY'):
					animChar.play("boy_left_move")
				elif (type == 'GIRL'):
					animChar.play("girl_left_move")
		if (move_input!=prev_move) :
			prev_move = move_input
	else:
		match prev_move :
			Vector2(0,1) :
				if (type == 'BOY'):
					animChar.play("boy_down")
				elif (type == 'GIRL'):
					animChar.play("girl_down")
			Vector2(0,-1) :
				if (type == 'BOY'):
					animChar.play("boy_up")
				elif (type == 'GIRL'):
					animChar.play("girl_up")
			Vector2(1,0) :
				if (type == 'BOY'):
					animChar.play("boy_right")
				elif (type == 'GIRL'):
					animChar.play("girl_right")
			Vector2(-1,0) :
				if (type == 'BOY'):
					animChar.play("boy_left")
				elif (type == 'GIRL'):
					animChar.play("girl_left")
		if (move_input!=prev_move) :
			prev_move = move_input

func update_animation_parameters_touch(move_input : Vector2, type : String):
	if joystick.touched :
		var prev_move
		match move_input :
			Vector2(0,1) :
				if (type == 'BOY'):
					animChar.play("boy_down_move")
				elif (type == 'GIRL'):
					animChar.play("girl_down_move")
			Vector2(0,-1) :
				if (type == 'BOY'):
					animChar.play("boy_up_move")
				elif (type == 'GIRL'):
					animChar.play("girl_up_move")
			Vector2(1,0) :
				if (type == 'BOY'):
					animChar.play("boy_right_move")
				elif (type == 'GIRL'):
					animChar.play("girl_right_move")
			Vector2(-1,0) :
				if (type == 'BOY'):
					animChar.play("boy_left_move")
				elif (type == 'GIRL'):
					animChar.play("girl_left_move")

func showInteractButton(hitItemName : String):
	self.itemName = hitItemName
	self.isHitItem = true
	interactButton.show()

func exitIten():
	self.itemName = ""
	self.isHitItem = false
	interactButton.hide()

func _on_bed_object_body_entered(body: Node2D) -> void:
	self.showInteractButton("Bed")

func _on_tutorial_body_entered(body: Node2D) -> void:
	self.showInteractButton("Tutorial")

func _on_desk_object_body_entered(body: Node2D) -> void:
	self.showInteractButton("Desk")

func _on_cafe_object_body_entered(body: Node2D) -> void:
	self.showInteractButton("Cafe")

func _on_cinema_object_body_entered(body: Node2D) -> void:
	self.showInteractButton("Cinema")

func _on_classroom_object_body_entered(body: Node2D) -> void:
	self.showInteractButton("Classroom")
	
func _on_friend_object_body_entered(body: Node2D) -> void:
	self.showInteractButton("Friend")

func _on_bookshelf_object_body_entered(body: Node2D) -> void:
	self.showInteractButton("Bookshelf")

func _on_desk_object_body_exited(body: Node2D) -> void:
	self.exitIten()

func _on_tutorial_body_exited(body: Node2D) -> void:
	self.exitIten()

func _on_bed_object_body_exited(body: Node2D) -> void:
	self.exitIten()

func _on_cafe_object_body_exited(body: Node2D) -> void:
	self.exitIten()

func _on_cinema_object_body_exited(body: Node2D) -> void:
	self.exitIten()

func _on_classroom_object_body_exited(body: Node2D) -> void:
	self.exitIten()

func _on_friend_object_body_exited(body: Node2D) -> void:
	self.exitIten()

func _on_bookshelf_object_body_exited(body: Node2D) -> void:
	self.exitIten()
	
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_F && self.isHitItem:
			self._on_interact_button_pressed()
		if event.keycode == KEY_TAB :
			self._on_stats_button_pressed()
		
func _on_stats_button_pressed() -> void:
	if !self.isShowStatus:
		statusTab.show()
	else:
		statusTab.hide()
	self.isShowStatus = !self.isShowStatus

func _on_interact_button_pressed() -> void:
	if !PlayerStatus.isOpenDialog:
		var objectDialog = self.itemName+'Object'
		
		if itemName == 'Tutorial' :
			DialogueManager.show_dialogue_balloon(load('res://dialogues/'+objectDialog+'.dialogue'))
		else :
			if PlayerStatus.gameTime == Global.GAME_TIME_NIGHT and itemName != 'Bed' and PlayerStatus.gameDate != Global.maxDatePerCycle:
				DialogueManager.show_dialogue_balloon(load('res://dialogues/SleepTime.dialogue'))
			elif  PlayerStatus.gameTime == Global.GAME_TIME_NIGHT and itemName == 'Bed' and PlayerStatus.gameDate != Global.maxDatePerCycle:
				DialogueManager.show_dialogue_balloon(load('res://dialogues/'+objectDialog+'.dialogue'))
			elif PlayerStatus.gameTime != Global.GAME_TIME_NIGHT and PlayerStatus.gameDate != Global.maxDatePerCycle and itemName == 'Bed' :
				DialogueManager.show_dialogue_balloon(load('res://dialogues/notSleepTime.dialogue'))
			elif PlayerStatus.gameTime != Global.GAME_TIME_NIGHT and PlayerStatus.gameDate == Global.maxDatePerCycle and itemName == 'Bed' :
				DialogueManager.show_dialogue_balloon(load('res://dialogues/testDateDialog.dialogue'))
			elif PlayerStatus.gameTime == Global.GAME_TIME_NIGHT and PlayerStatus.gameDate == Global.maxDatePerCycle and itemName == 'Bed' :
				DialogueManager.show_dialogue_balloon(load('res://dialogues/SleepOnExamDate.dialogue'))
			else:
				match itemName:
					'Desk':
						if PlayerStatus.gameDate == Global.maxDatePerCycle:
							DialogueManager.show_dialogue_balloon(load('res://dialogues/testDateDialog.dialogue'))
						elif PlayerStatus.gameTime == Global.GAME_TIME_EVENING:
							DialogueManager.show_dialogue_balloon(load('res://dialogues/'+objectDialog+'.dialogue'))
						else:
							DialogueManager.show_dialogue_balloon(load('res://dialogues/OutOfTime.dialogue'))
					'Cafe':
						if PlayerStatus.gameDate == Global.maxDatePerCycle:
							DialogueManager.show_dialogue_balloon(load('res://dialogues/testDateDialog.dialogue'))
						elif PlayerStatus.gameTime == Global.GAME_TIME_MORNING or PlayerStatus.gameTime == Global.GAME_TIME_AFTERNOON :
							DialogueManager.show_dialogue_balloon(load('res://dialogues/'+objectDialog+'.dialogue'))
						else:
							DialogueManager.show_dialogue_balloon(load('res://dialogues/OutOfTime.dialogue'))
					'Cinema':
						if PlayerStatus.gameDate == Global.maxDatePerCycle:
							DialogueManager.show_dialogue_balloon(load('res://dialogues/testDateDialog.dialogue'))
						elif PlayerStatus.gameTime == Global.GAME_TIME_AFTERNOON or PlayerStatus.gameTime == Global.GAME_TIME_EVENING :
							DialogueManager.show_dialogue_balloon(load('res://dialogues/'+objectDialog+'.dialogue'))
						else:
							DialogueManager.show_dialogue_balloon(load('res://dialogues/OutOfTime.dialogue'))
					'Classroom':
						if PlayerStatus.gameDate == Global.maxDatePerCycle and PlayerStatus.gameTime == Global.GAME_TIME_MORNING:
							DialogueManager.show_dialogue_balloon(load('res://dialogues/startTestExam.dialogue'))
						elif PlayerStatus.gameTime == Global.GAME_TIME_MORNING or PlayerStatus.gameTime == Global.GAME_TIME_AFTERNOON :
							DialogueManager.show_dialogue_balloon(load('res://dialogues/'+objectDialog+'.dialogue'))
						else:
							DialogueManager.show_dialogue_balloon(load('res://dialogues/OutOfTime.dialogue'))
					'Friend':
						if PlayerStatus.gameDate == Global.maxDatePerCycle:
							DialogueManager.show_dialogue_balloon(load('res://dialogues/testDateDialog.dialogue'))
						elif PlayerStatus.gameTime == Global.GAME_TIME_MORNING or PlayerStatus.gameTime == Global.GAME_TIME_AFTERNOON :
							DialogueManager.show_dialogue_balloon(load('res://dialogues/'+objectDialog+'.dialogue'))
						else:
							DialogueManager.show_dialogue_balloon(load('res://dialogues/OutOfTime.dialogue'))
					'Bookshelf':
						if PlayerStatus.gameDate == Global.maxDatePerCycle:
							DialogueManager.show_dialogue_balloon(load('res://dialogues/testDateDialog.dialogue'))
						elif PlayerStatus.gameTime == Global.GAME_TIME_MORNING or PlayerStatus.gameTime == Global.GAME_TIME_AFTERNOON :
							DialogueManager.show_dialogue_balloon(load('res://dialogues/'+objectDialog+'.dialogue'))
						else:
							DialogueManager.show_dialogue_balloon(load('res://dialogues/OutOfTime.dialogue'))
