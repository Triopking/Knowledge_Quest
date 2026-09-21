extends Node2D

@onready var arrow: Sprite2D = $Stones/Stone/Arrow
@onready var arrow_2: Sprite2D = $Stones/Stone2/Arrow2
@onready var arrow_3: Sprite2D = $Stones/Stone3/Arrow3
@onready var label_2: Label = $Label2

var rock
var rock_2
var rock_3
var question
var num
var num_2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	arrow.visible = false
	arrow_2.visible = false
	arrow_3.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	num = randi()%12
	num_2 = randi()%12
	question = str(num + " x " + num_2)
	label_2.text = "What does " + question + " equal to?"
	
	if rock == true and Input.is_action_just_pressed("click"):
		print("Mingus")
	elif rock_2 == true and Input.is_action_just_pressed("click"):
		print("Bingus")
	elif rock_3 == true and Input.is_action_just_pressed("click"):
		print("Wingus")


func _on_rock_1_mouse_entered() -> void:
	arrow.visible = true
	rock = true


func _on_rock_1_mouse_exited() -> void:
	arrow.visible = false
	rock = false


func _on_rock_2_mouse_entered() -> void:
	arrow_2.visible = true
	rock_2 = true

func _on_rock_2_mouse_exited() -> void:
	arrow_2.visible = false
	rock_2 = false


func _on_rock_3_mouse_entered() -> void:
	arrow_3.visible = true
	rock_3 = true


func _on_rock_3_mouse_exited() -> void:
	arrow_3.visible = false
	rock_3 = false
