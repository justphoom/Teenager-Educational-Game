extends CharacterBody2D

const SPEED = 320

@onready var joystick = $Joystick/Joycon
@onready var animChar = $PlayerCharacter

@onready var controller = $Joystick

var status_tabs = preload("res://player/StatusTab.tscn")
var status_tab_obj
var isOpenStatTab : bool = false

var prev_move : Vector2 = Vector2(0, 0)

var isShowStatus : bool = false
var isHitItem : bool = false
var itemName : String = ""

func _ready():
	#Temporaly setting for Tutorial
	# Tutorial.is_tutorial_state = false
	# $TimeDisplay.hide()
	self.isShowStatus = true
	#hide stat tab before get the book
	if !Tutorial.isGetArchiveBook:
		$Joystick/Stats.hide()
	if PlayerStatus.playerGender == 'BOY':
		animChar.play("boy_down")
	elif PlayerStatus.playerGender == 'GIRL':
		animChar.play("girl_down")
	setGlowingOff()

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

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_TAB && Tutorial.isGetArchiveBook:
			self._on_stats_button_pressed()
		
func _on_stats_button_pressed() -> void:
	if !Tutorial.isGetArchiveBook:
		pass
	elif isOpenStatTab:
		pass
	else:
		isOpenStatTab = true
		status_tab_obj = status_tabs.instantiate()
		add_child(status_tab_obj)

func set_close_stat_tab() -> void:
		isOpenStatTab = false

func setGlowingOff():
	$GlowingSpot_Player.visible = false
	
func setGlowingOn():
	$GlowingSpot_Player.visible = true

func show_status_tab():
	$Joystick/Stats.show()

func show_controller():
	controller.show()

func hide_controller():
	controller.hide()
