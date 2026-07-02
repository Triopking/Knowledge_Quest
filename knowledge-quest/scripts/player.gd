extends CharacterBody2D

var pos_to_go_to 
const SPEED = 20000



func _process(delta: float) -> void:
	# Add the gravity.
	if Input.is_action_just_pressed("click"):
		pos_to_go_to = get_global_mouse_position()
	if pos_to_go_to:
		var vel = global_position.direction_to(pos_to_go_to) * SPEED * delta
		velocity = vel
		
		if global_position.distance_to(pos_to_go_to) < 5:
			global_position = pos_to_go_to
			velocity = Vector2.ZERO
			pos_to_go_to = null

	move_and_slide()
