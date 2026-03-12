extends Node

var MAX_CYCLE = 3
var MAX_DAY_PER_CYCLE = 5

var GAME_TIME_MORNING : int = 0
var GAME_TIME_AFTERNOON : int = 1
var GAME_TIME_EVENING : int = 2
var GAME_TIME_NIGHT : int = 3

var IS_END_CYCLE_DATE : bool = false

var CafePrice : int = 30
var CinemaPrice : int = 50

var endingType : int = 0

var exitDelay : float = 0.15

var CURRENT_TIME : int = 0
var CURRENT_DAY : int = 0
var ASSESSMENT_DATE : bool = false
var CURRENT_CYCLE : int = 0

var ENDING_TYPE : int = 0

func day_time_update() -> void:
	CURRENT_TIME = (CURRENT_TIME+1)%4

func day_update() -> void:
	CURRENT_DAY = CURRENT_DAY+1
	if CURRENT_DAY == MAX_DAY_PER_CYCLE:
		ASSESSMENT_DATE = true

func day_time_after_test() -> void:
	CURRENT_TIME = CURRENT_TIME+3

func cycle_update() -> void:
	CURRENT_CYCLE = CURRENT_CYCLE + 1
	CURRENT_DAY = 0
	CURRENT_TIME = 0
	ASSESSMENT_DATE = false
	
	if CURRENT_CYCLE == MAX_CYCLE:
		ASSESSMENT_DATE = true
		print("End-Game Test")

func show_schedule():
	var schedule = $"../tutorial-bedroom/Schedule"
	schedule.show()

func character_selection_show_character():
	var CharacterSelectionScene = $"../CharacterSelection"
	CharacterSelectionScene.show_character()

func character_selection_cancel():
	var CharacterSelectionScene = $"../CharacterSelection"
	CharacterSelectionScene.cancel_selection()

func character_selection_confirm():
	var CharacterSelectionScene = $"../CharacterSelection"
	CharacterSelectionScene.start_game_confirmation()

func ON_BUYING_CAFE_ITEM():
	var CafeWindow = $"../Cafe/cafeObject/Cafe"
	CafeWindow.closed_window()

func ON_BUYING_CINEMA_ITEM():
	var CinemaWindow = $"../Cinema/cinemaObject/Cinema"
	CinemaWindow.closed_window()
