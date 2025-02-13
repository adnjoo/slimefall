extends Node2D

@export var level_1: String = "res://levels/level_1.tscn"
@onready var start_button = $VBoxContainer/StartButton  # Adjusted path to the StartButton
@onready var settings_button = $VBoxContainer/SettingsButton  # Adjusted path to the StartButton
@onready var exit_button = $VBoxContainer/ExitButton  # Adjusted path to the StartButton
@onready var about_link = $AboutLink  # Adjusted path to the StartButton
@onready var start_menu_panel = $VBoxContainer
@onready var settings_menu = $SettingsMenu

func toggle_settings_menu():
	settings_menu.visible = not settings_menu.visible
	get_tree().paused = settings_menu.visible  # Pause game when settings is open

# Separate the game start logic into a new function
func start_game():
	LivesUI.reset_lives()
	LivesUI.visible = true
	Engine.time_scale = 1.0
	get_tree().change_scene_to_file(level_1)

# Start Button Pressed Logic
func _on_start_button_pressed():
	start_game()

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
	settings_menu.hide()
	start_menu_panel.show()

func _on_mute_back_button_pressed() -> void:
	if LivesUI.main_music.playing:
		LivesUI._set_main_music(false)
	else:
		LivesUI._set_main_music(true)
