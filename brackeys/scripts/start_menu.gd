extends Node2D

@export var level_1: String = "res://levels/level_1.tscn"
@onready var start_button = $Panel/VBoxContainer/StartButton  # Adjusted path to the StartButton
@onready var about_link = $Panel/VBoxContainer/AboutLink  # Adjusted path to the StartButton
@onready var exit_button = $Panel/VBoxContainer/ExitButton  # Adjusted path to the StartButton

func _ready():
	pass

# Called when the start button is pressed
func _on_start_button_pressed():
	LivesUI.visible = true
	# Change the scene to Level 1
	get_tree().change_scene_to_file(level_1)

func _on_about_link_pressed() -> void:
	var url = "https://www.heybam.boo"  # Replace with the URL you want to open
	OS.shell_open(url)
	
func _on_exit_button_pressed() -> void:
	get_tree().quit()  # Quit the game
