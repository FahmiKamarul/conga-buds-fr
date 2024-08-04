extends Node

class_name StateMachine
var bud_type : Array[PackedScene] = [preload("res://chara/bam_bud.tscn"),
preload("res://chara/bud_biggie.tscn"), preload("res://chara/tappy_bud.tscn"), preload("res://chara/bud_ogu.tscn")]
@onready var head: bud = $"../head"
@onready var current_state: State = $Walk
@export var states:  Array[State]
var queue : Array[Transform2D]
@onready var direction: Vector2
var turn_info : Vector2
var SPEED = 1.0
var MAX_queue = 2000
var buds : Array[Node2D]
@onready var snake= $".."
var died = false
# Called when the node enters the scene tree for the first time.
func _ready():
	head.is_head = true
	head.statemachine = $"."
	
	direction = Vector2.RIGHT
	direction = Vector2.RIGHT.rotated(head.global_rotation)
	$"../backArea2D".monitoring = get_parent().is_king
	for child in get_children():
		if(child is State):
			states.append(child)
			child.head = head
			child.statemachine = $"."
		
		else: push_warning("Is not a state")
	

func set_direction(dir: Vector2):
	direction = dir.normalized()

func trail_transform():
	for bud_i in buds.size():
		if bud_i * 50 + 50 < queue.size():
			buds[bud_i].global_transform = queue[bud_i * 50 + 50]
	if buds.size() > 7:
		MAX_queue = 2000 + buds.size() * 200
	if queue.size() > 50 and not died:
		$"../backArea2D".visible = head.is_king
		$"../backArea2D".monitoring = head.is_king
		$"../backArea2D".global_rotation = queue[buds.size() * 50 + 50].get_rotation()
		$"../backArea2D".global_position = queue[buds.size() * 50 + 50].get_origin()

func add_bud():
	var rand_value = bud_type[randi() % bud_type.size()]
	var bud_ = rand_value.instantiate()
	$"../back".add_child(bud_)
	buds.append(bud_)
	bud_.bud_pop_in()

func add_buds(new_buds: Array[bud]):
	for new_bud in new_buds:
		new_bud.reparent($"../back")
		buds.append(new_bud)
		new_bud.bud_pop_in()
		$"../AudioStreamPlayer2D".play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	snake.length = buds.size() + 1
	$"../crown".visible = get_parent().is_king
	$"../crown".global_position = head.global_position + Vector2(0, -50)
	
	#queue.push_front(head.global_transform)
	#if queue.size() > MAX_queue:
		#queue.pop_back()
		
	
	if(current_state.next_state != null):
		switch_states(current_state.next_state)
		
	current_state.state_process(delta)
	
	trail_transform()
		
func switch_states(new_state: State):
	if(current_state != null):
		current_state.on_exit()
		current_state.next_state = null
		
	current_state = new_state
	
	current_state.on_enter()

func _input(event: InputEvent):
	current_state.state_input(event)
	if event.is_action_pressed("debug"):
		add_bud()


func _on_sprint_timeout():
	SPEED = 1.2
	pass # Replace with function body.

var time_total = 0
func _physics_process(delta):
	time_total += delta
	if time_total > 0.005:
		queue.push_front(head.global_transform)
		if queue.size() > MAX_queue:
			queue.pop_back()
	
