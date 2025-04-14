class_name Play extends State

@export var board: Board
@export var console: Console

var tween: Tween

func _init() -> void:
	pass

func enter() -> void:
	board.reset()
	var picked_numbers: Array[int] = []
	for spot in board.marked_spots:
		picked_numbers.append(spot.number)
	MathEngine.draw(picked_numbers)
	await _draw()
	emit_signal("transitioned", self, "idle")

func exit() -> void:
	pass

func interrupt() -> void:
	if tween:
		tween.custom_step(30)

func _draw() -> void:
	tween = create_tween()
	for drawn_number in MathEngine.drawn_numbers:
		var spot: Spot = board.spots[drawn_number - 1]
		if MathEngine.picked_numbers.has(drawn_number):
			tween.tween_callback(spot.toggle_hit.bind(true)).set_delay(0.25)
		else:
			tween.tween_callback(spot.toggle_overlay.bind(true)).set_delay(0.25)
	console.play_button.toggle_stop(true)
	console.play_button.toggle(true)
	await tween.finished
