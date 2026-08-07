extends Node2D

@onready var line_edit: LineEdit = $LineEdit

#shapes list for problems:

#triangle:
@onready var triangle: Sprite2D = $Shapes/Triangle
@onready var a_triangle: Label = $Shapes/Triangle/A
@onready var h_triangle: Label = $Shapes/Triangle/h
@onready var b_triangle: Label = $Shapes/Triangle/b

#rectangle:
@onready var rectangle: Sprite2D = $Shapes/Rectangle
@onready var a_rectangle: Label = $Shapes/Rectangle/A
@onready var l_rectangle: Label = $Shapes/Rectangle/l
@onready var h_rectangle: Label = $Shapes/Rectangle/h

#right angle triangle:
@onready var right_triangle: Sprite2D = $Shapes/RightTriangle
@onready var c: Label = $Shapes/RightTriangle/c
@onready var a: Label = $Shapes/RightTriangle/a
@onready var b: Label = $Shapes/RightTriangle/b

#square:
@onready var square: Sprite2D = $Shapes/Square
@onready var a_square: Label = $Shapes/Square/A
@onready var s_square: Label = $Shapes/Square/s

#the question label
@onready var question: Label = $Question

#the player feedback
@onready var correct: ColorRect = $CanvasLayer/Correct
@onready var incorrect: ColorRect = $CanvasLayer/Incorrect
@onready var a_timer: Timer = $CanvasLayer/Correct/Timer
@onready var b_timer: Timer = $CanvasLayer/Incorrect/Timer


#shapes
var shape
	
# sides of the shape
var side1
var side2

#number of questions
var qnum = 0
#answered the question
var answered = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	line_edit.grab_focus()
	line_edit.caret_column = (len(line_edit.text))
	triangle.visible = false
	rectangle.visible = false
	right_triangle.visible = false
	square.visible = false
	correct.visible = false
	incorrect.visible = false
	
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
	
	if shape == "right angled \ntriangle":
		question.text = "Question: What is c equal to?"
	else:
		question.text = "Question: What is the area of the " + shape + "?"
	
	if shape == "triangle":
		side1 = randi()%15+2
		b_triangle.text = str(side1)
		side2 = randi()%15+2
		h_triangle.text = str(side2)
		
	if shape == "rectangle":
		side1 = randi()%15+2
		l_rectangle.text = str(side1)
		side2 = randi()%15+2
		h_rectangle.text = str(side2)
		
	if shape == "right angled \ntriangle":
		side1 = randi()%15+2
		b.text = str(side1)
		side2 = randi()%15+2
		a.text = str(side2)
		
	if shape == "square":
		side1 = randi()%10+2
		s_square.text = str(side1)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	


func _on_line_edit_text_submitted(new_text: String) -> void:
	
	var answer = int(new_text)
	
	
	if shape == "square":
		if answer == side1**2:
			a_timer.start()
			correct.visible = true
			#print("that is correct!")
		else:
			incorrect.visible = true
			b_timer.start()
			#print("that is incorrect!")
	elif shape == "triangle":
		if answer == side1*side2*0.5:
			a_timer.start()
			correct.visible = true
			#print("that is correct!")
		else:
			incorrect.visible = true
			b_timer.start()
			#print("that is incorrect!")
	elif shape == "right angle \ntriangle":
		if answer == sqrt(side1**2+side2**2):
			a_timer.start()
			correct.visible = true
			#print("that is correct!")
		else:
			incorrect.visible = true
			b_timer.start()
			#print("that is incorrect!")
	else:
		if answer == side1 * side2:
			a_timer.start()
			correct.visible = true
			#print("that is correct!")
		else:
			incorrect.visible = true
			b_timer.start()
			#print("that is incorrect!")
	line_edit.text = ""
	answered = true
	
	

func _correct_timer() -> void:
	correct.visible = false
	if answered == true:
		_ready()
		answered = false


func _incorrect_timer() -> void:
	incorrect.visible = false
	if answered == true:
		_ready()
		answered = false
