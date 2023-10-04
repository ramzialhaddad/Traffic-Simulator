extends Area2D
var follow = false

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		
		if event.is_pressed():
			print("Clicked")
			follow = true
		
		elif not event.is_pressed():
			print("Unclicked")
			follow = false
		
func _process(delta):
	if(follow):
		self.get_parent().position = get_global_mouse_position()
