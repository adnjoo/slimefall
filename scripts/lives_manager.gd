extends CanvasLayer

@export var max_lives: int = 3
var current_lives: int
var score: int = 0

@export var start_menu: String = "res://scenes/start_menu.tscn"
@onready var sad_sound = $SadSound
@onready var main_music = $MainMusic
@onready var heart_container = $Panel/HBoxContainer
@onready var score_label: Label = $Panel/ScoreContainer/ScoreLabel
@onready var mobile_controls = $MobileControls
@onready var win_label: Label = $WinLabel

@export var full_heart_texture: Texture
@export var empty_heart_texture: Texture

var music_scene_instance: Node

func _ready():
	LivesUI.visible = true
	reset_lives()

func update_hearts():
	for i in range(heart_container.get_child_count()):
		var heart = heart_container.get_child(i)
		if heart is TextureRect:
			heart.texture = full_heart_texture if i < current_lives else empty_heart_texture

func reset_lives():
	current_lives = max_lives
	update_hearts()
	
func reset_points():
	score = 0
	update_score_ui()

func lose_life():
	if current_lives > 0:
		current_lives -= 1
		update_hearts()
		if current_lives == 0:
			game_over()

func add_point():
	score += 1
	update_score_ui()
	
func update_score_ui():
	score_label.text = str(score)

func game_over():
	print("Game Over!")  # Replace with your game over logic
	sad_sound.play()
	reset_points()
	
	# Stop the music when the game is over
	_set_main_music(false)
	
	LivesUI.visible = false
	
	get_tree().change_scene_to_file(start_menu)

func _on_sad_sound_finished() -> void:
	_set_main_music(true)  # Restart music after sad sound finishes

func _set_main_music(play_music: bool) -> void:
	if main_music:
		if play_music:
			if not main_music.playing:
				main_music.play()
		else:
			if main_music.playing:
				main_music.stop()

func _toggle_mobile_controls():
	if mobile_controls.visible:
		mobile_controls.visible = false
	else:
		mobile_controls.visible = true


func _on_settings_button_pressed() -> void:
	GameManager._go_to_settings()
