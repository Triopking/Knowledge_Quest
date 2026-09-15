extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.salrog_progress == 10:
		$Label.text = "You have took too long to reach 
						the knowledge core, try again."
	else:
		$Label.text = "Thank you for playing my game.
						
						Come back again some other time."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().quit()
