extends CharacterBody2D

class_name bud

var is_head = false
var is_out = false
var statemachine : StateMachine
var is_king
var hitted = false
@onready var sprite = $Sprite2D

func out_of_bound(is_out: bool):
	self.is_out = is_out
	pass

@onready var animationPlayer = $AnimationPlayer

func bud_pop_in():
	if animationPlayer != null:
		animationPlayer.play("bud_pop_in")

func combine():
	is_head = false
	var buds_c : Array[bud] = []
	buds_c.append(self)
	$Path2D.queue_free()
	$Line2D.queue_free()
	$Label.queue_free()
	$PointLight2D.queue_free()
	buds_c.append_array(statemachine.buds)
	statemachine.snake.queue_free()
	return buds_c

func hit():
	hitted = true

func _ready():
	
	if get_parent() is Snake:
		is_king = get_parent().is_king
		

