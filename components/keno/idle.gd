class_name Idle extends State

@export var board: Board
@export var console: Console

func enter() -> void:
	board.toggle(true)
	console.toggle(true)
	console.play_button.toggle_stop(false)


func exit() -> void:
	console.toggle(false)
	board.toggle(false)

func play() -> void:
	transitioned.emit(self, "play")
