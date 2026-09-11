extends Node

var is_tutorial_state : bool = true

var isGetArchiveBook : bool = false
var isOpenArchiveFirstTime : bool = false

func to_sleeping_scene():
	get_tree().change_scene_to_file('res://main-game-scenes/sleeping.tscn')

func show_status_tabs():
	var player = $"../tutorial-classroom/Player"
	player.show_status_tab()

func error_state():
	#DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-error.dialogue"))
	pass

#day-1
func day1_bedroom1_show_bedroom_exit():
	var day1_bedroom_scene = $"../Tutorial_Day1_Bedroom_1"
	day1_bedroom_scene.show_exit()
func day1_mainroad1_show_classroom():
	var day1_mainroad_scene = $"../Tutorial_Day1_Mainroad_1"
	day1_mainroad_scene.show_classroom()
func day1_friend_naming():
	var day1_classroom_scene = $"../Tutorial_Day1_Classroom_1"
	day1_classroom_scene.day1_classroom_naming()
func day1_classroom_show_classroom_object():
	var day1_classroom_scene = $"../Tutorial_Day1_Classroom_1"
	day1_classroom_scene.day1_classrrom_show_classroom_object()
func day1_classroom_get_archive():
	var day1_classroom_scene = $"../Tutorial_Day1_Classroom_1"
	day1_classroom_scene.day1_classroom_get_archive()
func day1_classroom_finished():
	var day1_classroom_scene = $"../Tutorial_Day1_Classroom_1"
	day1_classroom_scene.day1_classroom_show_exit()
func day1_bedroom2_show_schedule():
	var day1_bedroom_scene = $"../Tutorial_Day1_Bedroom_2"
	day1_bedroom_scene.show_schedule()
func day1_bedroom2_to_the_bed():
	var day1_bedroom_scene = $"../Tutorial_Day1_Bedroom_2"
	day1_bedroom_scene.show_bed()

# day-2
func day2_classroom_show_bookshelf():
	var day2_classroom_scene = $"../Tutorial_Day2_Classroom_1"
	day2_classroom_scene.show_bookshelf()
func day2_after_bookshelf():
	var day2_classroom_scene = $"../Tutorial_Day2_Classroom_1"
	day2_classroom_scene.after_bookshelf()
func day2_show_cafe():
	var day2_cafe_scene = $"../Tutorial_Day2_Cafe_1"
	day2_cafe_scene.show_cafe()
func day2_after_cafe():
	var day2_cafe_scene = $"../Tutorial_Day2_Cafe_1"
	day2_cafe_scene.after_cafe()	
func day2_show_cinema():
	var day2_cinema_scene = $"../Tutorial_Day2_Cinema_1"
	day2_cinema_scene.show_cinema()
func day2_after_cinema():
	var day2_cinema_scene = $"../Tutorial_Day2_Cinema_1"
	day2_cinema_scene.after_cinema()
	
#day-3
func day3_mainroad_1_show_arcade():
	var day3_mainroad_scene = $"../Tutorial_Day3_Mainroad_1"
	day3_mainroad_scene.show_arcade()
func day3_mainroad_2_show_sport():
	var day3_mainroad_scene = $"../Tutorial_Day3_Mainroad_2"
	day3_mainroad_scene.show_sport()
func day3_mainroad_3_show_bedroom():
	var day3_mainroad_scene = $"../Tutorial_Day3_Mainroad_3"
	day3_mainroad_scene.show_bedroom()
 #arcade & sport tutorial scripts
func show_arcade_play_button():
	var start_button = $"../Arcade/Start"
	start_button.show()
func show_sport_play_button():
	var start_button = $"../Sport/Start"
	start_button.show()
func after_chatting():
	var day3_bedroom_scene = $"../Tutorial_Day3_Bedroom_2"
	day3_bedroom_scene.show_bed()

#day-4
func day4_bedroom_show_exit():
	var day4_bedroom_scene = $"../Tutorial_Day4_Bedroom_1"
	day4_bedroom_scene.show_exit()
func day4_classroom_after_assessment():
	var day4_classroom_scene = $"../Tutorial_Day4_Classroom_1"
	day4_classroom_scene.show_exit()
#func show_arcade_play_button():
 	#var start_button = $"../Arcade/Start"
 	#start_button.show()

	
	
# #day-3 start show bedroom exit
# func day3_show_exit():
# 	var bedroom = $"../tutorial-bedroom"
# 	bedroom.show_exit_glow()
# #arcade & sport tutorial scripts
# func show_arcade_play_button():
# 	var start_button = $"../Arcade/Start"
# 	start_button.show()
# func show_sport_play_button():
# 	var start_button = $"../Sport/Start"
# 	start_button.show()
# #day3 back to hame check desktop
# func day3_show_desktop():
# 	var bedroom = $"../tutorial-bedroom"
# 	bedroom.show_desktop()
# #day3 after finish chatting
# func after_finish_tutorial_chatting():
# 	var desktop_object = $"../tutorial-bedroom/desktopObject"
# 	desktop_object.inactive_mode()
# 	var bedroom_object = $"../tutorial-bedroom/bedroomObject"
# 	bedroom_object.active_mode()
# 	print('set bedroom active')

# #day4 start to show exit
# func day4_show_exit():
# 	var bedroom = $"../tutorial-bedroom"
# 	bedroom.show_exit_glow()
# #day4 arrive school for testing
# func day4_show_classroom():
# 	var classroom_object = $"../tutorial-classroom/classroomObject"
# 	classroom_object.active_mode()
# #day4 after done testing
# func day4_done_test():
# 	var classroom_object = $"../tutorial-classroom/classroomObject"
# 	classroom_object.inactive_mode()
# 	var classroom = $"../tutorial-classroom"
# 	var classroom_exit_glow = $"../tutorial-classroom/GlowingSpot_Exit"
# 	classroom_exit_glow.setType(2)
# 	classroom.show_exit()
# #day4 done testing to sleep
# func day4_to_sleep():
# 	var bedroom_object = $"../tutorial-bedroom/bedroomObject"
# 	bedroom_object.active_mode()
