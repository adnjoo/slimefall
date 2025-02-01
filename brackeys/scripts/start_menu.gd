extends Node2D

@export var level_1: String = "res://levels/level_1.tscn"
@onready var start_button = $Panel/VBoxContainer/StartButton  # Adjusted path to the StartButton

func _ready():
	# Connect the button's "pressed" signal to a function
	start_button.pressed.connect(self._on_start_button_pressed)

# Called when the start button is pressed
func _on_start_button_pressed():
	LivesUI.visible = true
	# Change the scene to Level 1
	get_tree().change_scene_to_file(level_1)
