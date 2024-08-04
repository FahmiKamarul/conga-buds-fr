extends Node

class_name Level
@onready var sound_player :AudioStreamPlayer2D = $AudioStreamPlayer2D
var failed_popout: PackedScene = preload("res://failed_popout.tscn")
var success_popout: PackedScene = preload("res://success_popout.tscn")
var failed = false
var success = false
var audio_success = preload("res://success.wav")
var audio_hit = preload("res://Paste.wav")
# Called when the node enters the scene tree for the first time.
func complete():
	if not failed and not success:
		success = true
		sound_player.stream = audio_success
		sound_player.play()
		add_child(success_popout.instantiate())
	pass
	
func died(snakename):
	if not failed and not success:
		sound_player.stream = audio_hit
		sound_player.play()
		add_child(failed_popout.instantiate())
		failed = true
	
func next_level():
	GAMEMANAGER.next_level()
	
func return_to_title():
	GAMEMANAGER.to_title()

func restart():
	GAMEMANAGER.load_level(GAMEMANAGER.level_index)


