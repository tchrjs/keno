class_name Win extends State

@export var info_bar: InfoBar
@export var payouts: Payouts

func enter() -> void:
	info_bar.update()
	payouts.set_highlight()
	payouts.toggle_highlight(true)
	emit_signal("transitioned", self, "idle")

func exit() -> void:
	pass
