extends Node2D

#player character
@onready var player: CharacterBody2D = $Player

#message
@onready var label: Label = $question1/Label

#goes to this location when comes back from teleportation
@onready var marker: Marker2D = $question1/Marker2D
@onready var marker_2: Marker2D = $BridgePuzzle/Marker2D

#note inspection
@onready var note_inspection: ColorRect = $Player/CanvasLayer/NoteInspection
@onready var note_label: Label = $Player/CanvasLayer/NoteInspection/Label
@onready var paper: AudioStreamPlayer = $Player/CanvasLayer/NoteInspection/Paper

#note 1
@onready var note_1_label: Label = $Notes/Note2/note1Label
#note 2
@onready var note_2_label: Label = $Notes/Note3/note2Label
# note 3
@onready var note_3_label: Label = $Notes/Note4/note3Label
# note 4
@onready var note_4_label: Label = $Notes/Note5/note4Label
# note 5
@onready var note_5_label: Label = $Notes/Note6/note5Label
#note 6
@onready var note_6_label: Label = $Notes/Note7/note6Label
#note 7
@onready var note_7_label: Label = $Notes/Note8/note7Label
#note 8
@onready var note_8_label: Label = $Notes/Note9/note8Label
#note 9
@onready var note_9_label: Label = $Notes/Note10/note9Label
#note 10
@onready var note_10_label: Label = $Notes/Note11/note10Label
#note 11
@onready var note_11_label: Label = $Notes/Note12/note11Label
#note 12
@onready var note_12_label: Label = $Notes/Note13/note12Label
#note 13
@onready var note_13_label: Label = $Notes/Note14/note13Label
#note 14
@onready var note_14_label: Label = $Notes/Note15/note14Label
#note 15
@onready var note_15_label: Label = $Notes/Note16/note15Label

var press
var note_view

#these variables are for all of the notes detecting if the player is on the notes and to press e
var note_1  = false
var note_2  = false
var note_3  = false
var note_4  = false
var note_5  = false
var note_6  = false
var note_7  = false
var note_8  = false
var note_9  = false
var note_10 = false
var note_11 = false
var note_12 = false
var note_13 = false
var note_14 = false
var note_15 = false

var door
var end
var bridge

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#sets everything up, mainly hides all the notes press 'e' message
	note_1_label.visible  = false
	note_2_label.visible  = false
	note_3_label.visible  = false
	note_4_label.visible  = false
	note_5_label.visible  = false
	note_6_label.visible  = false
	note_7_label.visible  = false
	note_8_label.visible  = false
	note_9_label.visible  = false
	note_10_label.visible = false
	note_11_label.visible = false
	note_12_label.visible = false
	note_13_label.visible = false
	note_14_label.visible = false
	note_15_label.visible = false
	
	label.visible = false
	$KnowledgeCore/Label.hide()
	$BridgePuzzle/Label.hide()
	
	
	
	note_inspection.hide()
	$Player/CanvasLayer/ProgressBar.value = Global.salrog_progress
	$Door/Area2D/CollisionShape2D.disabled = false
	
	if Global.red_key == true:
		$Player/CanvasLayer/ProgressBar/RedKey.visible = true
	elif Global.red_key == false:
		$Player/CanvasLayer/ProgressBar/RedKey.visible = false
	
	if Global.cross_bridge == true:
		player.set_global_position(marker_2.global_position)
	
	if Global.red_door == true:
		$AnimationPlayer.play("open_sesame")
		$Door/Area2D/CollisionShape2D.disabled = true
	elif Global.red_door == false:
		$AnimationPlayer.play("RESET")
	
	if Global.shape_problem == true:
		player.set_global_position(marker.global_position)
		
	
	if Global.salrog_progress == 10:
		get_tree().change_scene_to_file("res://end.tscn")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	#most of these are just detections for when the player presses 
	#the 'e' key when on top of notes or the math problem.
	
	if press == true and Input.is_action_just_pressed("interact"):
		Global.shape_problem = true
		get_tree().change_scene_to_file("res://scenes/shape_problem.tscn")
	
	elif bridge == true and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://scenes/bridge_problem.tscn")
	
	#first map notes
	if note_1 == true and Input.is_action_just_pressed("interact"):
		note_view = "To calculate the 
					area of a 
					triangle, 
					It is equal:
					h * b * 1/2"
		note_label.text = note_view
		closer_look()
	elif note_2 == true and Input.is_action_just_pressed("interact"):
		note_view = "To calculate the
					area of a 
					square,
					It is equal:
					s * s"
		note_label.text = note_view
		closer_look()
	elif note_3 == true and Input.is_action_just_pressed("interact"):
		note_view = "To calculate the
					area of a
					cube,
					It is equal:
					L * L * L"
		note_label.text = note_view
		closer_look()
	elif note_4 == true and Input.is_action_just_pressed("interact"):
		note_view = "To calculate the
					area of a
					rectangle,
					It is equal:
					h * L"
		note_label.text = note_view
		closer_look()
	#second map notes
	if note_5 == true and Input.is_action_just_pressed("interact"):
		note_view = "Here are the 2 
		times tabels:
		2 * 2 = 4       2 * 3 = 6
		2 * 4 = 8       2 * 5 = 10
		2 * 6 = 12      2 * 7 = 14
		2 * 8 = 16      2 * 9 = 18
		2 * 10 = 20
		2 * 11 = 22
		2 * 12 = 24"
		note_label.text = note_view
		closer_look()
	
	elif note_6 == true and Input.is_action_just_pressed("interact"):
		note_view = "Here are the 3 
		times tabels:
		3 * 2 = 6       3 * 3 = 9
		3 * 4 = 12      3 * 5 = 15
		3 * 6 = 18      3 * 7 = 21
		3 * 8 = 24      3 * 9 = 27
		3 * 10 = 30
		3 * 11 = 33
		3 * 12 = 36"
		note_label.text = note_view
		closer_look()
	
	elif note_7 == true and Input.is_action_just_pressed("interact"):
		note_view = "Here are the 4 
		times tabels:
		4 * 2 = 8       4 * 3 = 12
		4 * 4 = 16      4 * 5 = 20
		4 * 6 = 24      4 * 7 = 28
		4 * 8 = 32      4 * 9 = 36
		4 * 10 = 40
		4 * 11 = 44
		4 * 12 = 48"
		note_label.text = note_view
		closer_look()
		
	elif note_8 == true and Input.is_action_just_pressed("interact"):
		note_view = "Here are the 5 
		times tabels:
		5 * 2 = 10       5 * 3 = 15
		5 * 4 = 20      5 * 5 = 25
		5 * 6 = 30      5 * 7 = 35
		5 * 8 = 40      5 * 9 = 45
		5 * 10 = 40
		5 * 11 = 55
		5 * 12 = 60"
		note_label.text = note_view
		closer_look()
	
	elif note_9 == true and Input.is_action_just_pressed("interact"):
		note_view = "Here are the 6 
		times tabels:
		6 * 2 = 12      6 * 3 = 18
		6 * 4 = 24      6 * 5 = 30
		6 * 6 = 36      6 * 7 = 42
		6 * 8 = 48      6 * 9 = 54
		6 * 10 = 60
		6 * 11 = 66
		6 * 12 = 72"
		note_label.text = note_view
		closer_look()
	
	elif note_10 == true and Input.is_action_just_pressed("interact"):
		note_view = "Here are the 7 
		times tabels:
		7 * 2 = 14      7 * 3 = 21
		7 * 4 = 28      7 * 5 = 35
		7 * 6 = 42      7 * 7 = 49
		7 * 8 = 56      7 * 9 = 63
		7 * 10 = 70
		7 * 11 = 77
		7 * 12 = 84"
		note_label.text = note_view
		closer_look()
	
	elif note_11 == true and Input.is_action_just_pressed("interact"):
		note_view = "Here are the 8 
		times tabels:
		8 * 2 = 16      8 * 3 = 24
		8 * 4 = 32      8 * 5 = 40
		8 * 6 = 48      8 * 7 = 56
		8 * 8 = 64      8 * 9 = 72
		8 * 10 = 80
		8 * 11 = 88
		8 * 12 = 96"
		note_label.text = note_view
		closer_look()
	
	elif note_12 == true and Input.is_action_just_pressed("interact"):
		note_view = "Here are the 9 
		times tabels:
		9 * 2 = 18      9 * 3 = 27
		9 * 4 = 36      9 * 5 = 45
		9 * 6 = 54      9 * 7 = 63
		9 * 8 = 72      9 * 9 = 81
		9 * 10 = 90
		9 * 11 = 99
		9 * 12 = 108"
		note_label.text = note_view
		closer_look()
	
	elif note_13 == true and Input.is_action_just_pressed("interact"):
		note_view = "Here are the 10 
		times tabels:
		10 * 2 = 20      10 * 3 = 30
		10 * 4 = 40      10 * 5 = 50
		10 * 6 = 60      10 * 7 = 70
		10 * 8 = 80      10 * 9 = 90
		10 * 10 = 100
		10 * 11 = 110
		10 * 12 = 120"
		note_label.text = note_view
		closer_look()
	
	elif note_14 == true and Input.is_action_just_pressed("interact"):
		note_view = "Here are the 11
		times tabels:
		11 * 2 = 22      11 * 3 = 33
		11 * 4 = 44      11 * 5 = 55
		11 * 6 = 66      11 * 7 = 77
		11 * 8 = 88      11 * 9 = 99
		11 * 10 = 110
		11 * 11 = 121
		11 * 12 = 132"
		note_label.text = note_view
		closer_look()
	
	elif note_15 == true and Input.is_action_just_pressed("interact"):
		note_view = "Here are the 12 
		times tabels:
		12 * 2 = 24      12 * 3 = 36
		12 * 4 = 48      12 * 5 = 60
		12 * 6 = 72      12 * 7 = 84
		12 * 8 = 96      12 * 9 = 108
		12 * 10 = 110
		12 * 11 = 132
		12 * 12 = 144"
		note_label.text = note_view
		closer_look()
	
	if door == true and Input.is_action_just_pressed("interact"):
		$AnimationPlayer.play("open_sesame")
		Global.red_door = true
		$Door/Area2D/CollisionShape2D.disabled = true
	
	if end == true and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://scenes/end.tscn")


func _question1_body_entered(body: Node2D) -> void:
	if body == player:
		label.visible = true
		press = true


func _on_question_1_body_exited(body: Node2D) -> void:
	if body == player:
		label.visible = false
		press = false


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")



func _on_note_button_pressed() -> void:
	note_inspection.visible = false
	Global.reading_note = false
	$Player/CanvasLayer/NoteInspection/Close.play()

#note inspection and different notes
func closer_look():
	paper.play()
	note_inspection.visible = true
	Global.reading_note = true

#first note
func _on_note_1_entered(body: Node2D) -> void:
	if body == player:
		note_1_label.visible = true
		note_1 = true
func _on_note_1_exited(body: Node2D) -> void:
	if body == player:
		note_1_label.visible = false
		note_1 = false

#second note
func _on_note_2_entered(body: Node2D) -> void:
	if body == player:
		note_2_label.visible = true
		note_2 = true

func _on_note_2_exited(body: Node2D) -> void:
	if body == player:
		note_2_label.visible = false
		note_2 = false

#third note
func _on_note_3_entered(body: Node2D) -> void:
	if body == player:
		note_3_label.visible = true
		note_3 = true

func _on_note_3_body_exited(body: Node2D) -> void:
	if body == player:
		note_3_label.visible = false
		note_3 = false
#fourth note
func _on_note_4_body_entered(body: Node2D) -> void:
	if body == player:
		note_4_label.visible = true
		note_4 = true

func _on_note_4_body_exited(body: Node2D) -> void:
	if body == player:
		note_4_label.visible = false
		note_4 = false

#entrance on door
func _on_door_body_entered(body: Node2D) -> void:
	if body == player and Global.red_key == true:
		$Door/Label.text = "You have the key to unlock this door! Press e to open it!"
		$Door/Label.visible = true
		door = true
	elif body == player and Global.red_key == false:
		$Door/Label.text = "This door needs a key to open, \ncome back when you have it"
		$Door/Label.visible = true

func _on_door_body_exited(body: Node2D) -> void:
	if  body == player:
		$Door/Label.visible = false
		door = false


func _on_finish_entered(body: Node2D) -> void:
	if body == player:
		end = true
		$KnowledgeCore/Label.visible = true


func _on_finish_exited(body: Node2D) -> void:
	if body == player:
		end = false
		$KnowledgeCore/Label.visible = false
		

func reposition():
	$Player/cameras/Camera2D2.set_global_position(player.global_position)


func _on_bridge_puzzle_body_entered(body: Node2D) -> void:
	if body == player:
		bridge = true
		$BridgePuzzle/Label.show()


func _on_bridge_puzzle_body_exited(body: Node2D) -> void:
	if body == player:
		bridge = false
		$BridgePuzzle/Label.hide()



func _on_note_5_entered(body: Node2D) -> void:
	if body == player:
		note_5_label.visible = true
		note_5 = true


func _on_note_5_exited(body: Node2D) -> void:
	if body == player:
		note_5_label.visible = false
		note_5 = false


func _on_note_6_entered(body: Node2D) -> void:
	if body == player:
		note_6_label.visible = true
		note_6 = true


func _on_note_6_exited(body: Node2D) -> void:
	if body == player:
		note_6_label.visible = false
		note_6 = false

func _on_note_7_entered(body: Node2D) -> void:
	if body == player:
		note_7_label.visible = true
		note_7 = true


func _on_note_7_exited(body: Node2D) -> void:
	if body == player:
		note_7_label.visible = false
		note_7 = false

func _on_note_8_entered(body: Node2D) -> void:
	if body == player:
		note_8_label.visible = true
		note_8 = true


func _on_note_8_exited(body: Node2D) -> void:
	if body == player:
		note_8_label.visible = false
		note_8 = false

func _on_note_9_entered(body: Node2D) -> void:
	if body == player:
		note_9_label.visible = true
		note_9 = true


func _on_note_9_exited(body: Node2D) -> void:
	if body == player:
		note_9_label.visible = false
		note_9 = false


func _on_note_10_entered(body: Node2D) -> void:
	if body == player:
		note_10_label.visible = true
		note_10 = true


func _on_note_10_exited(body: Node2D) -> void:
	if body == player:
		note_10_label.visible = false
		note_10 = false


func _on_note_11_entered(body: Node2D) -> void:
	if body == player:
		note_11_label.visible = true
		note_11 = true


func _on_note_11_exited(body: Node2D) -> void:
	if body == player:
		note_11_label.visible = false
		note_11 = false


func _on_note_12_entered(body: Node2D) -> void:
	if body == player:
		note_12_label.visible = true
		note_12 = true


func _on_note_12_exited(body: Node2D) -> void:
	if body == player:
		note_12_label.visible = false
		note_12 = false


func _on_note_13_entered(body: Node2D) -> void:
	if body == player:
		note_13_label.visible = true
		note_13 = true


func _on_note_13_exited(body: Node2D) -> void:
	if body == player:
		note_13_label.visible = false
		note_13 = false


func _on_note_14_entered(body: Node2D) -> void:
	if body == player:
		note_14_label.visible = true
		note_14 = true


func _on_note_14_exited(body: Node2D) -> void:
	if body == player:
		note_14_label.visible = false
		note_14 = false


func _on_note_15_entered(body: Node2D) -> void:
	if body == player:
		note_15_label.visible = true
		note_15 = true


func _on_note_15_exited(body: Node2D) -> void:
	if body == player:
		note_15_label.visible = false
		note_15 = false
