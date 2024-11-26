extends Node2D

func _on_button_pressed() -> void:
	Global.ads -=1
	queue_free()
