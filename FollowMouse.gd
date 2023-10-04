extends Node2D
var pos

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
"""
func _process(delta):
	pos = get_global_mouse_position()
	self.position = pos
	
	if(Input.is_mouse_button_pressed(1)):
		var query1 = PhysicsRayQueryParameters2D.create(pos, Vector2.UP)
		var result1 = get_world_2d().direct_space_state.intersect_ray(query1)
		
		print(result1)
		
		if result1:
			print("collided!")
			print(result1.collider.get_parent().name)
			result1.collider.get_parent().position += Vector2(10,10)
"""
