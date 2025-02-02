extends Node

@export var start_menu: String = "res://scenes/start_menu.tscn"

func _input(event):
	if event.is_action_pressed("ui_cancel"):  # ESC key
		get_tree().change_scene_to_file(start_menu)
		LivesUI.visible = false
