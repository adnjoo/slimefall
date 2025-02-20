extends Area2D

@export var level_2: String = "res://levels/level_2.tscn"
@export var level_3: String = "res://levels/level_3.tscn"
@export var start_menu: String = "res://scenes/start_menu.tscn"
@export var lives_manager = "res://scripts/lives_manager.gd"

@onready var game_win: AudioStreamPlayer2D = $GameWin
@onready var portal_sprite = $PortalSprite  # Reference to the AnimatedSprite2D
@onready var power_up_sound = $LevelChange  # Reference to the sound effect

const SAVE_PATH = "user://high_scores.cfg"
var high_score: int = 0

func _ready():
	var current_scene = get_tree().current_scene.name
	
	if current_scene == "level_3":
		portal_sprite.play("crystal")  # Switch to the crystal animation
	else:
		portal_sprite.play("default")  # Default animation
	
	# Load high score
	load_high_score()

func _on_body_entered(body):
	print("entered level exit")
	if body.is_in_group("Player"):  # Ensure player has the "Player" group
		body.disable_controls()  # Disable player movement

		var current_scene = get_tree().current_scene.name
		print(current_scene)
		
		if current_scene == "level_1":
			_play_power_up_and_change(level_2)
		elif current_scene == "level_2":
			_play_power_up_and_change(level_3)
		elif current_scene == "level_3":
			print("you win")
			
			game_win.play()
			
			# Save high score using GameManager.score
			save_high_score(GameManager.score)

			LivesUI.win_label2.text = "Your score is: " + str(GameManager.score)
			LivesUI.vbox_container.visible = true

			# Wait for 3 seconds before returning to start menu
			await get_tree().create_timer(3).timeout
			_change_scene(start_menu)  # Change to the start menu after the delay

		else:
			print("No next level defined for", current_scene)

# Helper function to change the scene, used with call_deferred
func _change_scene(level_path: String):
	get_tree().change_scene_to_file(level_path)
	
# Helper function to play sound and change the scene after a delay
func _play_power_up_and_change(level_path: String):
	power_up_sound.play()
	await power_up_sound.finished  # Wait for sound to finish before changing scene
	_change_scene(level_path)

# Load the high score from file
func load_high_score():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file:
		high_score = int(file.get_line())  # Read saved high score
		file.close()

# Save the new high score if it's higher
func save_high_score(current_score: int):
	if current_score > high_score:
		high_score = current_score  # Update high score
		var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
		file.store_line(str(high_score))  # Save the high score
		file.close()
