extends CanvasLayer

@onready var statsLabel = $Label
@onready var activityRecords = $ActivityRecords

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#statsLabel.text = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	statsLabel.text = "เงินที่มี : " + str(PlayerStatus.money)+ "\nเวลา : " + str(PlayerStatus.gameTime) + "\nวันที่ : " + str(PlayerStatus.gameDate) + "\nรอบที่ : " + str(PlayerStatus.gameCycle) + "\nmental : " + str(PlayerStatus.mental) + 	"\nphyscical : " + str(PlayerStatus.physcical) + 	"\nsocial : " + str(PlayerStatus.social) + 	"\nintelligent : " + str(PlayerStatus.intelligent)
	activityRecords.text = "เข้าเรียน : " + str(PlayerStatus.attendance) + "\nmental score: " + str(PlayerStatus.mentalActivityScore) + "\nphysicals score: " + str(PlayerStatus.physicalActivityScore) + "\nsocial score: " + str(PlayerStatus.socialActivityScore) + "\nintelligent score: " + str(PlayerStatus.intelligentActivityScore)
