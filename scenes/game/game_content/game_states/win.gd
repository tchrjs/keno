class_name Win extends State

@export var win_audio: AudioStreamPlayer
@export var info_bar: InfoBar
@export var payouts: Payouts

func enter() -> void:
	info_bar.update()
	payouts.set_highlight()
	payouts.toggle_highlight(true)
	MathEngine.draw_completed()
	win_audio.play()
	emit_signal("transitioned", self, "idle")

func exit() -> void:
	pass
