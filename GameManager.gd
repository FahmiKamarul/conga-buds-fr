extends Node

class_name GameManager

var levels : Array[PackedScene] = [preload("res://level_1.tscn"),preload("res://level_2.tscn"),preload("res://level_3.tscn"),preload("res://level_4.tscn")]
var title_sc: PackedScene =  preload("res://title_screen.tscn")
var endless_sc = preload("res://level_endless.tscn")
var level_index = 0
var current_scene: Node
# Called when the node enters the scene tree for the first time.
func _ready():
	#swap_scene(preload("res://level_test.tscn"))
	swap_scene(title_sc)
	pass

func load_level(level_i: int):
	var level
	if level_i == -1:
		level = endless_sc
	else:
		level = levels[level_i]
	level_index = level_i
	swap_scene(level)

func next_level():
	level_index += 1
	if levels.size() <= level_index:
		print(level_index)
		print(levels.size())
		swap_scene(title_sc)
	else:
		swap_scene(levels[level_index])
	pass

func reload_level():
	swap_scene(levels[level_index])

func to_title():
	swap_scene(title_sc)

func swap_scene(sc : PackedScene):
	if is_instance_valid(current_scene):
		current_scene.queue_free()
	if sc.can_instantiate():
		current_scene = sc.instantiate()
		add_child(current_scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
