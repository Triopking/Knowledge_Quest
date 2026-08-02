extends Node2D

@onready var line_edit: LineEdit = $LineEdit
@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	line_edit.grab_focus()
	line_edit.caret_column = (len(line_edit.text))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	label.text = ("Question: " + Global.questionName)
