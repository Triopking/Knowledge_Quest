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
# note 3
@onready var note_3_label: Label = $Notes/Note4/note3Label
# note 4
@onready var note_4_label: Label = $Notes/Note5/note4Label


var press
var note_view

var note_1
var note_2
var note_3
var note_4

var door
var end

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#sets everything up, mainly hides all the notes press 'e' message
	note_1_label.visible = false
	note_2_label.visible = false
	note_3_label.visible = false
	note_4_label.visible = false
	label.visible = false
	$KnowledgeCore/Label.visible = false
	
	note_1 = false
	note_2 = false
	note_3 = false
	note_4 = false
	
	note_inspection.visible = false
	$Player/CanvasLayer/ProgressBar.value = Global.salrog_progress
	$Door/Area2D/CollisionShape2D.disabled = false
	
	if Global.red_key == true:
		$Player/CanvasLayer/ProgressBar/RedKey.visible = true
	elif Global.red_key == false:
		$Player/CanvasLayer/ProgressBar/RedKey.visible = false
	
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
	
	if door == true and Input.is_action_just_pressed("interact"):
		$AnimationPlayer.play("open_sesame")
		Global.red_door = true
		$Door/Area2D/CollisionShape2D.disabled = true
	
	if end == true and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://end.tscn")


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
		$Door/Label.text = "You have the key to unlock this door!"
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
