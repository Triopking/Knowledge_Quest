extends Node2D

@onready var line_edit: LineEdit = $LineEdit

#shapes list for problems:

#triangle:
@onready var triangle: Sprite2D = $Shepes/Triangle
@onready var a_triangle: Label = $Shepes/Triangle/A
@onready var h_triangle: Label = $Shepes/Triangle/h
@onready var b_triangle: Label = $Shepes/Triangle/b

#rectangle:
@onready var rectangle: Sprite2D = $Shepes/Rectangle
@onready var a_rectangle: Label = $Shepes/Rectangle/A
@onready var l_rectangle: Label = $Shepes/Rectangle/l
@onready var h_rectangle: Label = $Shepes/Rectangle/h

#right angle triangle:
@onready var right_triangle: Sprite2D = $Shepes/RightTriangle
@onready var c: Label = $Shepes/RightTriangle/c
@onready var a: Label = $Shepes/RightTriangle/a
@onready var b: Label = $Shepes/RightTriangle/b

#square:
@onready var square: Sprite2D = $Shepes/Square
@onready var a_square: Label = $Shepes/Square/A
@onready var s_square: Label = $Shepes/Square/s

#the question label
@onready var question: Label = $Question


#shapes
var shape
	
# sides of the shape
var side1
var side2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	line_edit.grab_focus()
	line_edit.caret_column = (len(line_edit.text))
	triangle.visible = false
	rectangle.visible = false
	right_triangle.visible = false
	square.visible = false
	
	var rand = randi()%4
	
	
	
	#randomly selects a shape at random
	if rand == 0:
		triangle.visible = true
		shape = "triangle"
	elif rand == 1:
		rectangle.visible = true
		shape = "rectangle"
	elif rand == 2:
		right_triangle.visible = true
		shape = "right angled \ntriangle"
	elif rand == 3:
		square.visible = true
		shape = "square"
	
	question.text = "Question: What is the area of a " + shape + "?"
	
	if shape == "triangle":
		side1 = randi()%10+1
		b_triangle.text = str(side1)
		side2 = randi()%10+1
		h_triangle.text = str(side2)
		
	if shape == "rectangle":
		side1 = randi()%10+1
		l_rectangle.text = str(side1)
		side2 = randi()%10+1
		h_rectangle.text = str(side2)
		
	if shape == "right angled triangle":
		side1 = randi()%10+1
		b.text = str(side1)
		side2 = randi()%10+1
		a.text = str(side2)
		
	if shape == "square":
		side1 = randi()%10+1
		s_square.text = str(side1)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	


func _on_line_edit_text_submitted(new_text: String) -> void:
	
	var answer = int(new_text)
	
	
	if shape == "square":
		if answer == side1**2:
			print("that is correct!")
		else:
			print("that is incorrect!")
	else:
		if answer == side1 * side2:
			print("that is correct!")
		else:
			print("that is incorrect!")
	
