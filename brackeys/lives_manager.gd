extends CanvasLayer

@export var max_lives: int = 3
var current_lives: int

@export var start_menu: String = "res://scenes/start_menu.tscn"
@onready var heart_container = $HBoxContainer
@onready var sad_sound = $SadSound
@onready var main_music = $MainMusic
@export var full_heart_texture: Texture
@export var empty_heart_texture: Texture

var music_scene_instance: Node

func _ready():
	current_lives = max_lives
	update_hearts()
	
	# Connect the finished signal of the sad sound to a function
	sad_sound.finished.connect(self._on_sad_sound_finished)

func update_hearts():
	for i in range(heart_container.get_child_count()):
		var heart = heart_container.get_child(i)
		if heart is TextureRect:
			heart.texture = full_heart_texture if i < current_lives else empty_heart_texture

func lose_life():
	if current_lives > 0:
		current_lives -= 1
		update_hearts()
		if current_lives == 0:
			game_over()

func game_over():
	print("Game Over!")  # Replace with your game over logic
	sad_sound.play()
	
	# Stop the music when the game is over
	main_music.stop()
	
	LivesUI.visible = false
	
	get_tree().change_scene_to_file(start_menu)


func _on_sad_sound_finished() -> void:
	main_music.play()
