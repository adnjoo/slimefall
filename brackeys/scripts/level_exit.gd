extends Area2D

@export var level_2: String = "res://levels/level_2.tscn"
@export var level_3: String = "res://levels/level_3.tscn"

func _on_body_entered(body):
	print("entered level exit")
	if body.is_in_group("Player"):  # Ensure player has the "Player" group
		var current_scene = get_tree().current_scene.name
		print(current_scene)
		if current_scene == "level_1":
			call_deferred("_change_scene", level_2)  # Use deferred call to change scene
		elif current_scene == "level_2":
			call_deferred("_change_scene", level_3)  # Use deferred call to change scene
		elif current_scene == "level_3":
			print("you win")
		else:
			print("No next level defined for", current_scene)

# Helper function to change the scene, used with call_deferred
func _change_scene(level_path: String):
	get_tree().change_scene_to_file(level_path)
