class_name InfoBar extends Control

@export var state_machine: StateMachine
@export var board: Board
@export var label: Label

func _ready() -> void:
	board.connect("marked_spots_updated", update)
	idle()

func update() -> void:
	if state_machine:
		match state_machine.get_current_state_name():
			"idle": idle()
			"play": play()
			"win": win()
			"lose": lose()

func idle() -> void:
	if board.marked_spots.size() < MathEngine.min_pick:
		label.text = "Pick " + str(MathEngine.min_pick) + " or More Spots to Draw!"
	elif Platform.credits < MathEngine.get_current_bet_credits():
		label.text = "Change Bet or Insert Credits"
	else:
		label.text = "Change Spots or Touch Draw!"

func play() -> void:
	label.text = "Good Luck!"

func win() -> void:
	label.text = "Win $" + str("%0.2f" % (float(MathEngine.credits_won) / 100))

func lose() -> void:
	label.text = "Better Luck Next Time!"
