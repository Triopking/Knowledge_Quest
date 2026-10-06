extends Node2D

@onready var arrow: Sprite2D = $Stones/Stone/Arrow
@onready var arrow_2: Sprite2D = $Stones/Stone2/Arrow2
@onready var arrow_3: Sprite2D = $Stones/Stone3/Arrow3
@onready var label_2: Label = $Label2

#labels on the rocks
@onready var rock_label: Label = $Stones/Stone/Label
@onready var rock_label_2: Label = $Stones/Stone2/Label2
@onready var rock_label_3: Label = $Stones/Stone3/Label3

#the feedback:
#correct answers
@onready var timer: Timer = $CanvasLayer/ColorRect/Timer
@onready var cpu_particles_2d: CPUParticles2D = $CanvasLayer/ColorRect/CPUParticles2D
@onready var color_rect: ColorRect = $CanvasLayer/ColorRect

#incorrect answers
@onready var color_rect_2: ColorRect = $CanvasLayer/ColorRect2
@onready var timer_2: Timer = $CanvasLayer/ColorRect2/Timer
@onready var correct_answer: Label = $CanvasLayer/ColorRect2/CorrectAnswer

#these are for if the mouse is hovering over the rocks
var rock
var rock_2
var rock_3

var question
var num #the first number in the question
var num_2 #the second numner in te question
var random

#these are the options that are on the rocks
var op1
var op2
var op3

#the values for health and questions left:
#health:
@onready var health: Sprite2D = $Health
var health_left = 3

#questions:
@onready var questions: Sprite2D = $Questions
var questions_left = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_up()
	

func set_up():
	#sees if the player answered 3 questions correctly
	if questions_left == 3:
		good_ending()
	else:
		questions.frame = questions_left
	#checks if the player has answered 3 questions incorrectly
	if health_left == 0:
		bad_ending()
	else:
		health.frame = health_left
	
	arrow.visible = false
	arrow_2.visible = false
	arrow_3.visible = false
	
	#sets question up
	num = randi()%11 + 2
	num_2 = randi()%11 + 2
	question = str(num) + " x " + str(num_2)
	label_2.text = "What does " + question + " equal to?"
	
	#this assigns the rock's answers, one is correct while the others are not
	random = randi()%3
	if random == 0: #the rock on the right is the correct answer
		op1 = str(num*num_2)
		rock_label.text = op1
		op2 = str(randi()%143+2)
		rock_label_2.text = op2
		op3 = str(randi()%143+2)
		rock_label_3.text = op3
	elif random == 1:#the rock on the middle is the correct answer
		op1 = str(num*num_2)
		rock_label_2.text = op1
		op2 = str(randi()%143+2)
		rock_label.text = op2
		op3 = str(randi()%143+2)
		rock_label_3.text = op3
	elif random == 2:#the rock on the left is the correct answer
		op1 = str(num*num_2)
		rock_label_3.text = op1
		op2 = str(randi()%143+2)
		rock_label_2.text = op2
		op3 = str(randi()%143+2)
		rock_label.text = op3
	
	color_rect.hide()
	color_rect_2.hide()
	cpu_particles_2d.restart()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if rock == true and Input.is_action_just_pressed("click"):
		
		if num*num_2 == int(rock_label.text):
			
			color_rect.show()
			cpu_particles_2d.emitting = true
			timer.start()
		elif not (num*num_2 == int(rock_label.text)):
			color_rect_2.show()
			correct_answer.text = "The right answer is " + str(num*num_2)
	
			timer_2.start()
	elif rock_2 == true and Input.is_action_just_pressed("click"):
		
		if num*num_2 == int(rock_label_2.text):
			
			color_rect.show()
			cpu_particles_2d.emitting = true
			timer.start()
		elif not (num*num_2 == int(rock_label_2.text)):
			color_rect_2.show()
			correct_answer.text = "The right answer is " + str(num*num_2)
			timer_2.start()
	elif rock_3 == true and Input.is_action_just_pressed("click"):
		
		if num*num_2 == int(rock_label_3.text):
			
			color_rect.show()
			cpu_particles_2d.emitting = true
			timer.start()
		elif not (num*num_2 == int(rock_label_3.text)):
			color_rect_2.show()
			correct_answer.text = "The right answer is " + str(num*num_2)
		
			timer_2.start()


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


func _on_correct_timeout() -> void:
	color_rect.hide()
	cpu_particles_2d.emitting = false
	questions_left += 1
	set_up()


func _on_incorrect_timeout() -> void:
	color_rect_2.hide()
	health_left -= 1
	set_up()

func good_ending():
	Global.cross_bridge = true
	Global.red_key = false
	get_tree().change_scene_to_file("res://scenes/math_level.tscn")
	

func bad_ending():
	Global.salrog_progress += 2
	get_tree().change_scene_to_file("res://scenes/math_level.tscn")
	
