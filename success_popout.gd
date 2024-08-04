extends Control

func _on_button_pressed():
	if get_parent() is Level:
		get_parent().next_level()
	pass # Replace with function body.
	



func _on_button_2_pressed():
	if get_parent() is Level:
		get_parent().return_to_title()
	pass # Replace with function body.
