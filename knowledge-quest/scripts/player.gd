extends CharacterBody2D
#help from Bradely Cave to make the point and click mechanic
#tutorial by Single-Minded Ryan & DevWorm for pathfinding
var pos_to_go_to 
const SPEED = 20000
@onready var path_follow_2d: NavigationAgent2D = $PathFollow2D
var direction: Vector2

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		pos_to_go_to = get_global_mouse_position()
		path_follow_2d.target_position = pos_to_go_to
		direction = to_local(path_follow_2d.get_next_path_position()).normalized()
		
	if pos_to_go_to && path_follow_2d.is_target_reached() == false:
		
		velocity = direction * SPEED * delta
		
		if global_position.distance_to(pos_to_go_to) < 5 && path_follow_2d.is_target_reached() == true:
			global_position = pos_to_go_to
			velocity = Vector2.ZERO
			pos_to_go_to = null
	
	

	move_and_slide()
