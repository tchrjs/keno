class_name Spot extends Button

signal mark_toggled(spot: Spot, toggled_on: bool)

@export var background: TextureRect
@export var mark: TextureRect
@export var label: Label

var number: int = -1
var is_marked: bool = false

func set_number(new_number: int) -> void:
	number = new_number
	label.text = str(number)

func toggle_mark(toggled_on: bool) -> void:
	if toggled_on == is_marked:
		return

	is_marked = toggled_on
	label.text = "X" if is_marked else str(number)
	mark.visible = is_marked

func _on_mouse_entered() -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		emit_signal("mark_toggled", self, !is_marked)

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal("mark_toggled", self, !is_marked)
