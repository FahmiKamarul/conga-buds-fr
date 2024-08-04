extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_button_pressed():
	$Control.visible = false
	$Control2.visible = true
	# GAMEMANAGER.swap_scene(preload(level_select))
	pass # Replace with function body.


func _on_button1_pressed():
	GAMEMANAGER.load_level(0)
	pass # Replace with function body.


func _on_button_2_pressed():
	GAMEMANAGER.load_level(1)
	pass # Replace with function body.


func _on_button_3_pressed():
	GAMEMANAGER.load_level(2)
	pass # Replace with function body.


func _on_button_4_pressed():
	GAMEMANAGER.load_level(3)
	pass # Replace with function body.


func _on_button_5_pressed():
	GAMEMANAGER.load_level(-1)
	pass # Replace with function body.
