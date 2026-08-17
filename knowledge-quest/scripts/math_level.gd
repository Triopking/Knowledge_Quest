extends Node2D

#player character
@onready var player: CharacterBody2D = $Player

#message
@onready var label: Label = $question1/Label

#goes to this location when comes back from teleportation
@onready var marker: Marker2D = $question1/Marker2D

#note inspection
@onready var note_inspection: ColorRect = $Player/CanvasLayer/NoteInspection
@onready var note_label: Label = $Player/CanvasLayer/NoteInspection/Label
@onready var paper: AudioStreamPlayer = $Player/CanvasLayer/NoteInspection/Paper

#note 1
@onready var note_1_label: Label = $Notes/Note2/note1Label
#note 2
@onready var note_2_label: Label = $Notes/Note3/note2Label



var press
var note_view

var note_1
var note_2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	note_1_label.visible = false
	note_2_label.visible = false
	label.visible = false
	note_inspection.visible = false
	$Player/CanvasLayer/ProgressBar.value = Global.salrog_progress
	if Global.shape_problem == true:
		player.set_global_position(marker.global_position)
		



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	
	if press == true and Input.is_action_just_pressed("interact"):
		Global.shape_problem = true
		get_tree().change_scene_to_file("res://scenes/shape_problem.tscn")
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


func _on_note_2_entered(body: Node2D) -> void:
	if body == player:
		note_2_label.visible = true
		note_2 = true

func _on_note_2_exited(body: Node2D) -> void:
	if body == player:
		note_2_label.visible = false
		note_2 = false
