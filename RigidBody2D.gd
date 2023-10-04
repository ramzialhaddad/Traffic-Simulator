extends RigidBody2D

func _process(delta):
	get_node("../RichTextLabel").text = "Velocity: %s" % self.linear_velocity

func _physics_process(delta):
	# "Friction"
	self.apply_force(-self.linear_velocity*1.5)
	
	
	# Key Movements
	if Input.is_key_label_pressed(KEY_W):
		self.apply_force(Vector2(0, -1000))
		
	if Input.is_key_label_pressed(KEY_S):
		self.apply_force(Vector2(0, 1000))
		
	if Input.is_key_label_pressed(KEY_A):
		self.angular_velocity += -5
		
	if Input.is_key_label_pressed(KEY_D):
		self.angular_velocity += 5
	
	if Input.is_key_label_pressed(KEY_SPACE):
		self.apply_force(-self.linear_velocity*4)
