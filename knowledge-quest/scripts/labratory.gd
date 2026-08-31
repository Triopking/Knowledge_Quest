extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var label: Label = $Area2D/Label
var on
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.visible = false
	on = false
	Global.health = 4


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if on == true and Input.is_action_pressed("interact"):
		get_tree().change_scene_to_file("res://scenes/math_level.tscn")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:#when the player is on the door, it should go to the math level.
		label.visible = true
		on = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == player:
		label.visible = false
		on = false
	


func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer2.play()
