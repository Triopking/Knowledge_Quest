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

#circle:
@onready var cube: Sprite2D = $Shapes/Cube
@onready var l: Label = $Shapes/Cube/l



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

#question number display
@onready var questions: Sprite2D = $Questions
#health display
@onready var health_bar: Sprite2D = $Health

#particles
@onready var particles: CPUParticles2D = $CanvasLayer/Correct/CPUParticles2D

#sounds
@onready var next_question: AudioStreamPlayer = $"Next question"

#shapes
var shape
	
# sides of the shape
var side1
var side2

#number of questions
var qnum = 0
#amount of health
var health = 3
#answered the question
var answered = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if qnum > 3:
		end()
	elif health == 0:
		bad_end()
	else:
		questions.frame = qnum
		health_bar.frame = health
	
	
	line_edit.caret_column = (len(line_edit.text))
	triangle.visible = false
	rectangle.visible = false
	cube.visible = false
	square.visible = false
	correct.visible = false
	incorrect.visible = false
	#particles.emitting = false
	
	
	var rand = randi()%4
	
	#randomly selects a shape at random
	if rand == 0:
		triangle.visible = true
		shape = "triangle"
	elif rand == 1:
		rectangle.visible = true
		shape = "rectangle"
	elif rand == 2:
		cube.visible = true
		shape = "cube"
	elif rand == 3:
		square.visible = true
		shape = "square"
	
	if shape == "cube":
		question.text = "Question: What is the volume of the " + shape + "?"
	else:
		question.text = "Question: What is the area of the " + shape + "?"
	
	
	if shape == "triangle":
		side1 = randi()%10+2
		b_triangle.text = str(side1)
		side2 = side1+1
		h_triangle.text = str(side2)
		
	if shape == "rectangle":
		side1 = randi()%10+1
		l_rectangle.text = str(side1)
		side2 = randi()%10+1
		h_rectangle.text = str(side2)
		
	if shape == "cube":
		side1 = randi()%5+1
		l.text = str(side1)
		
		
	if shape == "square":
		side1 = randi()%8+2
		s_square.text = str(side1)
	



func _process(_delta: float) -> void:
	line_edit.grab_focus()
	


func _on_line_edit_text_submitted(new_text: String) -> void:
	
	var answer = int(new_text)
	#each shape has a different way of calculating
	
	if shape == "square":
		if answer == side1**2:
			a_timer.start()
			correct.visible = true
			particles.emitting = true
	
		else:
			$CanvasLayer/Incorrect/AudioStreamPlayer.play()
			incorrect.visible = true
			b_timer.start()
	
	elif shape == "triangle":
		if answer == side1*side2*0.5:
			a_timer.start()
			correct.visible = true
			particles.emitting = true
	
		else:
			$CanvasLayer/Incorrect/AudioStreamPlayer.play()
			incorrect.visible = true
			b_timer.start()
	
	elif shape == "cube":
		if answer == side1**3 :
			a_timer.start()
			correct.visible = true
			particles.emitting = true
	
		else:
			$CanvasLayer/Incorrect/AudioStreamPlayer.play()
			incorrect.visible = true
			b_timer.start()
	
	else:
		if answer == side1 * side2:
			a_timer.start()
			correct.visible = true
			particles.emitting = true
	
		else:
			$CanvasLayer/Incorrect/AudioStreamPlayer.play()
			incorrect.visible = true
			b_timer.start()
	
	line_edit.text = ""
	answered = true

func _correct_timer() -> void:
	correct.visible = false
	qnum += 1
	if answered == true:
		_ready()
		answered = false


func _incorrect_timer() -> void:
	incorrect.visible = false
	health -= 1
	
	if answered == true:
		_ready()
		answered = false

func bad_end():
	Global.red_key = false
	Global.salrog_progress += 2
	get_tree().change_scene_to_file("res://scenes/math_level.tscn")
func end():
	Global.red_key = true
	get_tree().change_scene_to_file("res://scenes/math_level.tscn")
