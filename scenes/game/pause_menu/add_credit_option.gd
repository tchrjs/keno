class_name AddCreditOption extends Control

@export var option_button: OptionButton
@export var button: Button

var credits: int = 0

func _on_add_credit_button_pressed() -> void:
	Platform.add_credits(int(option_button.get_item_text(option_button.selected)))
