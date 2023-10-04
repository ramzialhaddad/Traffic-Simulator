extends Node2D

var space_state
var pos

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_collisionshape2d_input(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		print("Hello!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	space_state = get_world_2d().direct_space_state
	pos = get_global_mouse_position()
	
	if(Input.is_mouse_button_pressed(1)):
		draw_circle(pos, 1, Color.RED)
		var query1 = PhysicsRayQueryParameters2D.create(Vector2.ZERO, pos)
		var result1 = space_state.intersect_ray(query1)
		
		print(result1)
		
		if result1:
			print("collided!")
			print(result1.collider.get_parent().name)
			result1.collider.get_parent().position += Vector2(10,10)
	
"""
	# use global coordinates, not local to node
	var query2 = PhysicsRayQueryParameters2D.create(self.position, Vector2.DOWN)
	var result = space_state.intersect_ray(query2)
	
	
	if result:
		print(result.collider)
		result.collider.get_parent().position += Vector2(10, 0)
	#else:
		#print("no hit")
		
		"""


func _on_rigid_body_2d_input_event(viewport, event, shape_idx):
	print("hello")


func _on_rigid_body_2d_mouse_entered():
	print("mouse enter!")


func _on_rigid_body_2d_mouse_shape_entered(shape_idx):
	print("mouse entered again")
