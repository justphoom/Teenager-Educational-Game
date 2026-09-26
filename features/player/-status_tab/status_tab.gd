extends CanvasLayer

#@onready var statsLabel = $Label
#@onready var activityRecords = $ActivityRecords

@onready var page1 = $page1
@onready var page2 = $page2
@onready var page3 = $page3

var boy_img = preload("res://assets/MainCharacter/Boy/Down/Down1.png")
var girl_img = preload("res://assets/MainCharacter/Girl/Down/Down1.png")
@onready var playerImage = $page1/Page1PlayerImage
@onready var playerName = $page1/Page1PlayerName
@onready var playerMoney = $page1/Page1PlayerMoney
@onready var playerDatetime = $page1/Page1PlayerDatetime
@onready var playerPhysical = $page1/Page1ScorePhysical
@onready var playerPhysicalImage = $page1/Page1ScorePhysicalImage
@onready var playerIntelligence = $page1/Page1ScoreIntelligence
@onready var playerIntelligenceImage = $page1/Page1ScoreIntelligenceImage
@onready var playerSocial = $page1/Page1ScoreSocial
@onready var playerSocialImage = $page1/Page1ScoreSocialImage
@onready var playerMental = $page1/Page1ScoreMental
@onready var playerMentalImage = $page1/Page1ScoreMentalImage
var score_danger = preload("res://assets/Misc/GrowingSpot_Black.png")
var score_warning = preload("res://assets/Misc/GrowingSpot_Red.png")
var score_normal = preload("res://assets/Misc/GrowingSpot_Yellow.png")
var score_good = preload("res://assets/Misc/GrowingSpot_Green.png")
var score_excellent = preload("res://assets/Misc/GrowingSpot_White.png")
@onready var time_text = $page1/Page1Time
@onready var time_sprite = $page1/Page1TimeImage
var time_morning = preload("res://assets/Misc/GrowingSpot_Yellow.png")
var time_afternoon = preload("res://assets/Misc/GrowingSpot_Yellow.png")
var time_evening = preload("res://assets/Misc/GrowingSpot_Yellow.png")
var time_night = preload("res://assets/Misc/GrowingSpot_Yellow.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	init_content_page1()
	init_content_page2()
	init_content_page3()
	active_page_1()

func _on_button_pressed() -> void:
	self.queue_free()

func _on_tree_exiting() -> void:
	#if Tutorial.isOpenArchiveFirstTime:
		#Tutorial.isOpenArchiveFirstTime = false
		##DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day1/day1-classroom-4.dialogue"))
		#print("open archive first time")
	var player = $"../"
	#player.set_close_stat_tab()

func active_page_1():
	page1.show()
	page2.hide()
	page3.hide()

func active_page_2():
	page1.hide()
	page2.show()
	page3.hide()

func active_page_3():
	page1.hide()
	page2.hide()
	page3.show()

func _on_page_1_next_pressed() -> void:
	active_page_2()

func _on_page_2_next_pressed() -> void:
	active_page_3()

func _on_page_2_prev_pressed() -> void:
	active_page_1()

func _on_page_3_prev_pressed() -> void:
	active_page_2()

func init_content_page1() -> void:
#	check player profile (image, name, money, day-cycle)
	match PlayerStatus.playerGender:
		'BOY':
			playerImage.texture = boy_img
		'GIRL':
			playerImage.texture = girl_img
		_ :
			playerImage.texture = boy_img
	playerName.text = 'ชื่อ : ' + PlayerStatus.playerName
	playerMoney.text = 'เงินที่มี : ' + str(PlayerStatus.money) + ' บาท'
	playerDatetime.text = 'วันที่ : ' + str(PlayerStatus.gameDate) + ' | '+ 'รอบที่ : ' + str(PlayerStatus.gameCycle)
#	check player score status (4 dimensions; mental, physical, social, intelligence)
	checking_and_update_player_score(PlayerStatus.physcical, playerPhysical, playerPhysicalImage)
	checking_and_update_player_score(PlayerStatus.intelligent, playerIntelligence, playerIntelligenceImage)
	checking_and_update_player_score(PlayerStatus.social, playerSocial, playerSocialImage)
	checking_and_update_player_score(PlayerStatus.mental, playerMental, playerMentalImage)
#	display time
	checking_daytime(PlayerStatus.gameTime)
	pass

func init_content_page2() -> void:
	pass
	
func init_content_page3() -> void:
	pass

func checking_and_update_player_score(score, scoreLabel, sprite) -> void:
	match score:
		-2:
			scoreLabel.text = scoreLabel.text + 'วิกฤต'
			sprite.texture = score_danger
		-1:
			scoreLabel.text = scoreLabel.text + 'เริ่มแย่'
			sprite.texture = score_warning
		0:
			scoreLabel.text = scoreLabel.text + 'ปกติ'
			sprite.texture = score_normal
		1:
			scoreLabel.text = scoreLabel.text + 'ดี'
			sprite.texture = score_good
		2:
			scoreLabel.text = scoreLabel.text + 'ดีเยี่ยม'
			sprite.texture = score_excellent
		_:
			scoreLabel.text = scoreLabel.text + 'ปกติ'
			sprite.texture = score_normal

func checking_daytime(time):
	match time:
		0:
			time_text.text = time_text.text + 'เช้า'
			time_sprite.texture = time_morning
		1:
			time_text.text = time_text.text + 'บ่าย'
			time_sprite.texture = time_afternoon
		2:
			time_text.text = time_text.text + 'เย็น'
			time_sprite.texture = time_evening
		3:
			time_text.text = time_text.text + 'กลางคืน'
			time_sprite.texture = time_night
