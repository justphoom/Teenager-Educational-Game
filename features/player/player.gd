extends Node2D

@export var MOVE_SPEED : float = 320

@onready var joystick = $Joystick/Joycon
@onready var controller = $Joystick
@onready var interactButton = %Interact

var prev_move : Vector2 = Vector2(0, 0)
var PlayerCharacter : CharacterBody2D
var PlayerCharacterSprite : AnimatedSprite2D
var currentItemName : String

func _ready():
	self.adding_player_character(PlayerStatus.PLAYER_GENDER)
	Signals.object_entered.connect(_on_object_entered, 1)
	Signals.object_exited.connect(_on_object_exited)
	Signals.object_finished.connect(_on_finished_object)
	DialogueManager.dialogue_started.connect(_on_dialog_started, 1)
	DialogueManager.dialogue_ended.connect(_on_dialog_ended, 1)
	interactButton.hide()

func _physics_process(delta: float) -> void:
	var input_direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	self.PlayerCharacter.velocity = input_direction * self.MOVE_SPEED
	if joystick.touched :
		var direction = joystick.posVector
		if direction:
			self.PlayerCharacter.velocity = direction * MOVE_SPEED
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
			input_direction = Vector2(direction.x, direction.y)
		else:
			self.PlayerCharacter.velocity = Vector2(0,0)
	if Global.DIALOGUE_IS_RUNNING:
		return
	self.update_animation_parameters(input_direction)
	var collision_obj = self.PlayerCharacter.move_and_slide()

func update_animation_parameters(move_input : Vector2) -> void:
	if(move_input != Vector2.ZERO):
		match move_input :
			Vector2(0,1) :
				self.PlayerCharacterSprite.play("down_move")
			Vector2(0,-1) :
				self.PlayerCharacterSprite.play("up_move")
			Vector2(1,0) :
				self.PlayerCharacterSprite.play("right_move")
			Vector2(-1,0) :
				self.PlayerCharacterSprite.play("left_move")
		if (move_input != prev_move) :
			prev_move = move_input
	else:
		match prev_move :
			Vector2(0,1) :
				self.PlayerCharacterSprite.play("down")
			Vector2(0,-1) :
				self.PlayerCharacterSprite.play("up")
			Vector2(1,0) :
				self.PlayerCharacterSprite.play("right")
			Vector2(-1,0) :
				self.PlayerCharacterSprite.play("left")
		if (move_input != prev_move) :
			prev_move = move_input

func adding_player_character(gender) -> void:
	self.PlayerCharacter = load(COMPONENT_PATH.CHARACTER_PATH.get(gender)).instantiate()
	add_child(self.PlayerCharacter)
	self.PlayerCharacterSprite = self.PlayerCharacter.get_node("PlayerCharacter")

func _on_object_entered(name: String) -> void:
	currentItemName = name
	interactButton.show()

func _on_object_exited() -> void:
	currentItemName = String()
	interactButton.hide()

func _on_dialog_started(resource : DialogueResource) -> void:
	controller.hide()

func _on_dialog_ended(resource : DialogueResource) -> void:
	if ObjectiveAction.using_item:
		return
	controller.show()

func _on_finished_object() -> void:
	controller.show()

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_TAB:
			self._on_stats_button_pressed()
		if event.keycode == KEY_Z:
			self._on_interact_button_pressed()

func _on_interact_button_pressed() -> void:
	if currentItemName:
		DialogueManager.show_dialogue_balloon(load(DIALOGUE_PATH.init_objective))

func _on_stats_button_pressed() -> void:
	print("open status tab")
