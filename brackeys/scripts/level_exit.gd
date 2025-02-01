extends Area2D

@export var next_level: String = "res://scenes/level_2.tscn"



func _on_body_entered(body):
	print("entered level exit")
	if body.is_in_group("Player"):  # Ensure player has the "Player" group
		get_tree().change_scene_to_file(next_level)
