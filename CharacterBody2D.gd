extends CharacterBody2D

var wheel_base = 70
var steering_angle = 20
var engine_power = 800
var friction = -0.9
var drag = -0.001
var braking = -450
var max_speed_reverse = 250

var acceleration = Vector2.ZERO
var steer_direction

func _ready():
	velocity = Vector2.ZERO

func _physics_process(delta):
	acceleration = Vector2.ZERO
	getInput()
	applyFriction()
	calculateSteering(delta)
	velocity += acceleration * delta
	move_and_slide()
	
func getInput():
	var turn = 0
	if Input.is_key_label_pressed(KEY_D):
		turn += 1
	if Input.is_key_label_pressed(KEY_A):
		turn -= 1
	steer_direction = turn * deg_to_rad(steering_angle)
	
	if Input.is_key_label_pressed(KEY_W):
		acceleration = transform.x * engine_power
		
	if Input.is_key_label_pressed(KEY_S):
		acceleration = transform.x * braking
		
func calculateSteering(delta):
	var rearWheel = position - transform.x * wheel_base/2
	var frontWheel = position + transform.x * wheel_base/2
	rearWheel += velocity * delta
	frontWheel += velocity.rotated(steer_direction) * delta
	var newDirection = (frontWheel - rearWheel).normalized()
	
	var d = newDirection.dot(velocity.normalized())
	
	if d > 0:
		velocity = newDirection * velocity.length()
	if d < 0:
		velocity = -newDirection * min(velocity.length(), max_speed_reverse)
	
	
	rotation = newDirection.angle()
	
func applyFriction():
	if velocity.length() < 5:
		velocity = Vector2.ZERO
		
	var frictionForce = velocity * friction
	var dragForce = velocity * velocity.length() * drag
	acceleration += dragForce + frictionForce
	
