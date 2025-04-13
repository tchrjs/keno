class_name Idle extends State

@export var board: Board
@export var dashboard: Dashboard

func enter() -> void:
	dashboard.enable_all()
	board.toggle(true)
	dashboard.play_button.toggle_stop(false)

func exit() -> void:
	dashboard.disable_all()
	board.toggle(false)

func play() -> void:
	transitioned.emit(self, "play")
