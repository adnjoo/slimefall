extends Node2D

@export var level_1: String = "res://levels/level_1.tscn"
@onready var start_button = $Panel/VBoxContainer/StartButton  # Adjusted path to the StartButton
@onready var settings_button = $Panel/VBoxContainer/SettingsButton  # Adjusted path to the StartButton
@onready var about_link = $Panel/VBoxContainer/AboutLink  # Adjusted path to the StartButton
@onready var exit_button = $Panel/VBoxContainer/ExitButton  # Adjusted path to the StartButton
@onready var settings_menu = $SettingsMenu
@onready var start_menu_panel = $StartMenuPanel

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

# Settings
func _on_settings_button_pressed() -> void:
	start_menu_panel.hide()
	settings_menu.show()
	

func _on_settings_back_button_pressed() -> void:
	print('pres')
	settings_menu.hide()
	start_menu_panel.show()

func _on_mute_back_button_pressed() -> void:
	pass # Replace with function body.
