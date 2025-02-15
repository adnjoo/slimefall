extends Area2D

@onready var animation_player = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	LivesUI.add_point()
	animation_player.play("pickup")
