extends Node2D

class_name Snake

var length = 1
@export var is_king = false
@export var start_dir : Vector2 = Vector2.RIGHT
@export var SPEED: float = 1
@export_range(0,3,1) var sprite_type:  int
@export var has_light = false
# Called when the node enters the scene tree for the first time.
func _ready():
	print($head.sprite.rotation)
	$head.rotation = start_dir.angle()
	$StateMachine.set_direction(start_dir)
	$StateMachine.SPEED = SPEED
	var sprites_path = [preload("res://chara/biggie_sprite.png"), preload("res://chara/ogu_sprite.png"), preload("res://chara/tappy_sprite.png"), preload("res://chara/bam_sprite.png")]
	$head.sprite.texture = sprites_path[sprite_type]
	$ghost.sprite.texture = sprites_path[sprite_type]
	$head/PointLight2D.enabled = has_light
	$head.bud_pop_in()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
