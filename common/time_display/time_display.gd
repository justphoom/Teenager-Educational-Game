extends CanvasLayer

@onready var timeLabel = $Label
@onready var dayLabel = $Label2
@onready var cycleLabel = $Label3
@onready var testDateLabel = $Label4

func _process(_delta: float) -> void:
	timeLabel.text = "เวลา : " + str(Global.CURRENT_TIME)
	dayLabel.text = "วันที่ : " + str(Global.CURRENT_DAY)
	cycleLabel.text = "รอบที่ : " + str(Global.CURRENT_CYCLE)
	testDateLabel.text = "วันสอบ : " + str(Global.ASSESSMENT_DATE)
