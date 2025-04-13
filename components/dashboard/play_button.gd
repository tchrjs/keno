class_name PlayButton extends Button

signal play_pressed
signal stop_pressed

var is_stop: bool = false

func toggle_stop(toggled_on: bool) -> void:
	is_stop = toggled_on
	text = "Stop" if toggled_on else "Draw"

func _pressed():
	disabled = true
	if is_stop:
		emit_signal("stop_pressed")
	else:
		emit_signal("play_pressed")
