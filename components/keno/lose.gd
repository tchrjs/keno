class_name Lose extends State

@export var info_bar: InfoBar

func enter() -> void:
	info_bar.update()
	emit_signal("transitioned", self, "idle")

func exit() -> void:
	pass
