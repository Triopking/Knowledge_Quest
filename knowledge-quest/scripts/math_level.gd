extends Node2D

#player character
@onready var player: CharacterBody2D = $Player

#message
@onready var label: Label = $question1/Label

var press

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	
	if press == true and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://scenes/shape_problem.tscn")
	


func _question1_body_entered(body: Node2D) -> void:
	if body == player:
		label.visible = true
		press = true


func _on_question_1_body_exited(body: Node2D) -> void:
	if body == player:
		label.visible = false
		press = false
