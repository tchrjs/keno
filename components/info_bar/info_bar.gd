class_name InfoBar extends Control

@export var state_machine: StateMachine
@export var board: Board
@export var label: Label

func _ready():
	board.connect("marked_spots_updated", update)
	idle()

func update() -> void:
	if state_machine and state_machine.current_state:
		match state_machine.current_state.name.to_lower():
			"idle": idle()
			"play": play()

func idle() -> void:
	if board.marked_spots.size() < MathEngine.min_pick:
		label.text = "Pick " + str(MathEngine.min_pick) + " or More Spots to Draw!"
	else:
		label.text = "Change Spots or Touch Draw!"

func play() -> void:
	label.text = "Good Luck!"
