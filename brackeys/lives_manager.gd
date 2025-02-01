extends CanvasLayer

@export var max_lives: int = 3
var current_lives: int

@onready var heart_container = $HBoxContainer
@export var full_heart_texture: Texture  # Assign heart_full.png in the Inspector
@export var empty_heart_texture: Texture  # Assign heart_empty.png in the Inspector

func _ready():
	current_lives = max_lives
	update_hearts()

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
