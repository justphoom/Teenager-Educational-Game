extends Node


var PLAYER_GENDER: int = CONSTANT.CHARACTER_TYPE.GIRL
var PLAYER_NAME : String = 'ชื่อทดสอบ'

const start_money : int = 50
var money : int = start_money

var mentalLevel : int = CONSTANT.PLAYER_BEHAVIOR_SOCRE.NORMAL
var physcicalLevel : int = CONSTANT.PLAYER_BEHAVIOR_SOCRE.NORMAL
var socialLevel : int = CONSTANT.PLAYER_BEHAVIOR_SOCRE.NORMAL
var intelligentLevel : int = CONSTANT.PLAYER_BEHAVIOR_SOCRE.NORMAL

func reset_player():
	money = start_money
	mentalLevel = CONSTANT.PLAYER_BEHAVIOR_SOCRE.NORMAL
	physcicalLevel = CONSTANT.PLAYER_BEHAVIOR_SOCRE.NORMAL
	socialLevel = CONSTANT.PLAYER_BEHAVIOR_SOCRE.NORMAL	
	intelligentLevel = CONSTANT.PLAYER_BEHAVIOR_SOCRE.NORMAL

#var mentalActivityScore : int = 0
#var physicalActivityScore : int = 0
#var socialActivityScore : int = 0
#var intelligentActivityScore : int = 0

#var isOpenDialog : bool = false

#var PREV_SCENE: String = ''
#var gameTime : int = 0
#var gameDate : int = 0
#var gameCycle : int = 0
#var attendance : int = 0
#var isAttendClass : bool = false
#var isHardExam : bool = false
#
#func doActivity():
	#print("do activity")
	#self.gameTime += 1
#
#func doSleepActivity():
	#self.gameTime = 0
	#self.gameDate += 1
	#self.money += 10
	#
	#if isAttendClass :
		#self.attendance += 1
		#self.isAttendClass = false
#
#func doDeskActivity():
	#self.intelligentActivityScore += 1
#
#func doChatActivity():
	#self.mentalActivityScore += 1
	#self.socialActivityScore += 1
#
#func doBookshelfActivity():
	#self.intelligentActivityScore += 1
#
#func doFriendActivity():
	#self.mentalActivityScore += 1
	#self.socialActivityScore += 1
#
#func doClassroomActivity():
	#self.isAttendClass = true
	#self.intelligentActivityScore += 1
	#self.socialActivityScore += 1
#
#func doCafeActivity():
	#self.money -= Global.CafePrice
	#self.mentalActivityScore += 1
	#self.physicalActivityScore += 1
#
#func doCinemaActivity():
	#self.money -= Global.CinemaPrice
	#self.mentalActivityScore += 1
	#self.socialActivityScore += 1
#
#func doArcadeActivity():
	#self.mentalActivityScore += 1
	#self.physicalActivityScore += 1
#
#func doSportActivity():
	#self.physicalActivityScore += 2
#
#func checkAttendance():
	#pass
	##if self.attendance < (Global.maxDatePerCycle/2):
		##isHardExam = true
		##print("this will be a hard exam")
	##else:
		##print("this will be not a hard exam")
#
#func doEndPhase():
	#self.isHardExam = false
	#self.gameTime = 0
	#self.gameDate = 0
	#self.gameCycle += 1
	#self.money += 10
#
#func updateGrowthStatus():
	#if self.mentalActivityScore > 10:
		#self.mental += 1
	#elif self.mentalActivityScore < 5 :
		#self.mental -= 1
	#self.mentalActivityScore = 0
	#
	#if self.physicalActivityScore > 10:
		#self.physcical += 1
	#elif self.physicalActivityScore < 5 :
		#self.physcical -= 1
	#self.physicalActivityScore = 0
	#
	#if self.socialActivityScore > 10:
		#self.social += 1
	#elif self.socialActivityScore < 35 :
		#self.social -= 1
	#self.socialActivityScore = 0
	#
	#if self.intelligentActivityScore > 10:
		#self.intelligent += 1
	#elif self.intelligentActivityScore < 5 :
		#self.intelligent -= 1
	#self.intelligentActivityScore = 0
	#
#func doExam():
	#self.gameTime = Global.GAME_TIME_NIGHT
#
#func doSleepActivityAndChangePhase():
	#self.gameTime = 0
	#self.gameDate = 0
	#self.gameCycle += 1
	#self.money += 10
	#self.attendance = 0
	#if self.gameCycle != Global.maxCycle :
		#self.updateGrowthStatus()
#
#func goToEndGame():
	#if (self.physcical < 0 and
		#self.mental < 0 and
		#self.social < 0 and
		#self.intelligent == 2):
			#Global.endingType = 2
	#elif (self.physcical == 2 and
		#self.mental == 2 and
		#self.social == 2 and
		#self.intelligent <= 0  ):
		##and
		##Global.assesmentPercentage >= 15):
			#Global.endingType = 3
	#else:
		#Global.endingType = 1
	#get_tree().change_scene_to_file("res://main-game-scenes/ending.tscn")
	#
#func resetStats():
	#self.isHardExam = false
	#self.attendance = 0
	#self.gameTime = 0
	#self.gameDate = 0
	#self.gameCycle += 0
	#self.money = 50
	#self.mental = 0
	#self.physcical = 0
	#self.social = 0
	#self.intelligent = 0
	#self.mentalActivityScore = 0
	#self.physicalActivityScore = 0
	#self.socialActivityScore = 0
	#self.intelligentActivityScore = 0
