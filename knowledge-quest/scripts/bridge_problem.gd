extends Node2D

@onready var arrow: Sprite2D = $Stones/Stone/Arrow
@onready var arrow_2: Sprite2D = $Stones/Stone2/Arrow2
@onready var arrow_3: Sprite2D = $Stones/Stone3/Arrow3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	arrow.visible = false
	arrow_2.visible = false
	arrow_3.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_rock_1_mouse_entered() -> void:
	arrow.visible = true


func _on_rock_1_mouse_exited() -> void:
	arrow.visible = false


func _on_rock_2_mouse_entered() -> void:
	arrow_2.visible = true


func _on_rock_2_mouse_exited() -> void:
	arrow_2.visible = false


func _on_rock_3_mouse_entered() -> void:
	arrow_3.visible = true


func _on_rock_3_mouse_exited() -> void:
	arrow_3.visible = false
