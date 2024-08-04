extends State

@onready var pivot : Node2D = $"../../pivot"
var total_rot
var target_rot
var double_click
func on_enter():
	total_rot = 0
	pivot.global_position = statemachine.direction.rotated(PI/2) * statemachine.turn_info.x + head.global_position
	head.reparent(pivot)
	target_rot = statemachine.turn_info.y
	double_click = false

func state_input(event):
	if event is InputEventScreenTouch:
		var dis = event.position - head.global_position
		if event.pressed and dis.length() < 30:
			if not double_click:
				$"../../doubleClick".start()
				double_click = true
			else:
				double_click = false
				stop_turn()

func state_process(delta):
	if head.hitted:
		next_state = $"../Dead"
	$"../../ghost".visible = true
	var rot = 1 * statemachine.SPEED * delta * 90 / statemachine.turn_info.x
	pivot.rotation += rot
	total_rot += rot
	check_stop()

func check_stop():
	if abs(total_rot) > target_rot:
		stop_turn()

func stop_turn():
		next_state = $"../Walk"
		var a = head.global_transform
		head.reparent($"../..")
		head.global_transform= a
		statemachine.direction = Vector2.RIGHT.rotated(head.global_rotation)

func on_exit():
	$"../../ghost".visible = false

func sig(x):
	return 1/(1 + pow(2.718281828,-x))


func _on_double_click_timeout():
	double_click = false
	pass # Replace with function body.
