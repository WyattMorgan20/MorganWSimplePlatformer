extends Area2D


signal flag_entered


func _on_flag_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("flag_entered")
