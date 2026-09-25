extends Node2D

@onready var arrow: Sprite2D = $Stones/Stone/Arrow
@onready var arrow_2: Sprite2D = $Stones/Stone2/Arrow2
@onready var arrow_3: Sprite2D = $Stones/Stone3/Arrow3
@onready var label_2: Label = $Label2

#labels on the rocks
@onready var rock_label: Label = $Stones/Stone/Label
@onready var rock_label_2: Label = $Stones/Stone2/Label2
@onready var rock_label_3: Label = $Stones/Stone3/Label3


var rock
var rock_2
var rock_3
var question
var num
var num_2
var random

var op1
var op2
var op3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	arrow.visible = false
	arrow_2.visible = false
	arrow_3.visible = false
	
	#sets question up
	num = randi()%11 + 2
	num_2 = randi()%11 + 2
	question = str(num) + " x " + str(num_2)
	label_2.text = "What does " + question + " equal to?"
	
	random = randi()%3
	if random == 0:
		op1 = str(num*num_2)
		rock_label.text = op1
		op2 = str(randi()%143+2)
		rock_label_2.text = op2
		op3 = str(randi()%143+2)
		rock_label_3.text = op3
	elif random == 1:
		op1 = str(num*num_2)
		rock_label_2.text = op1
		op2 = str(randi()%143+2)
		rock_label.text = op2
		op3 = str(randi()%143+2)
		rock_label_3.text = op3
	elif random == 2:
		op1 = str(num*num_2)
		rock_label_3.text = op1
		op2 = str(randi()%143+2)
		rock_label_2.text = op2
		op3 = str(randi()%143+2)
		rock_label.text = op3
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	
	
	if rock == true and Input.is_action_just_pressed("click"):
		if num*num_2 == int(rock_label.text):
			$CanvasLayer/ColorRect.show()
			$CanvasLayer/ColorRect/CPUParticles2D.emitting = true
	elif rock_2 == true and Input.is_action_just_pressed("click"):
		if num*num_2 == int(rock_label_2.text):
			$CanvasLayer/ColorRect.show()
			$CanvasLayer/ColorRect/CPUParticles2D.emitting = true
	elif rock_3 == true and Input.is_action_just_pressed("click"):
		if num*num_2 == int(rock_label_3.text):
			$CanvasLayer/ColorRect.show()
			$CanvasLayer/ColorRect/CPUParticles2D.emitting = true


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
