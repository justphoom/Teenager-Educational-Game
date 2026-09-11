extends CharacterBody2D

@export var initRotationConst = -90

@onready var parent = $".."
@onready var directionObj = $Direction
const rotationDegreeRange = 60
var rotation_speed = 0.05
var rotation_direction = 1
var ballSpeed : float = 800
var ballIsShoot : bool = false

func _ready():
	directionObj.rotate(initRotationConst)
	if parent.hardMode:
		rotation_speed = 0.10
	else :
		rotation_speed = 0.05
	pass

func _physics_process(delta):
	# manually animated virtual direction of the ball
	var ballMove
	if (directionObj.global_rotation_degrees > rotationDegreeRange + initRotationConst or directionObj.global_rotation_degrees < -1 * rotationDegreeRange + initRotationConst):
		rotation_direction = rotation_direction * -1
	# if the ball is not shoot direction is still rotated
	if !ballIsShoot:
		directionObj.rotate(rotation_speed * rotation_direction)
	else:
		var ballDirection = calculateBallMovingDirection(directionObj.global_rotation_degrees)
		self.velocity = ballDirection * ballSpeed
		ballMove =  move_and_collide(self.velocity*0.02)
		if ballMove:
			if ballMove.get_collider().name == 'Goal' :
				parent.currentScore += 1
				self.hit_the_wall()
			if ballMove.get_collider().name == 'Wall' :
				self.hit_the_wall()
	
func calculateBallMovingDirection(angle : float) -> Vector2:
	var returnVector : Vector2
	var calculatedAngle = degreeToRadian(directionObj.global_rotation_degrees - initRotationConst)
	var calculatedVector = Vector2(cos(calculatedAngle) , sin(calculatedAngle))		
	var initRotationRadian = degreeToRadian(initRotationConst)
	returnVector = Vector2((calculatedVector.x*cos(initRotationRadian) - calculatedVector.y*sin(initRotationRadian)) , (calculatedVector.x*sin(initRotationRadian) + calculatedVector.y*cos(initRotationRadian)))
	return returnVector
	
func degreeToRadian(degree: float) -> float:
	var returnRadian : float = degree * PI/180
	return returnRadian

func shoot():
	ballIsShoot = true
	parent.currentAttemt += 1
	directionObj.hide()

func hit_the_wall():
	#Global.ball_hit_the_wall()
	self.queue_free()
	if parent.currentAttemt != parent.totalAttempt:
		parent.initNextBall()
	else:
		parent.showFinishButton()
	
func _on_interact_button_pressed() -> void:
	$Button.hide()
	shoot()
