extends State



func state_process(delta):
	if head.hitted:
		next_state = $"../Dead"
	head.position = head.position + statemachine.direction * statemachine.SPEED * 70 * delta
	if head.is_out:
		next_state = $"../Dead"
	pass


var is_dragging = false 
var drag_pos
var target 
var rad = 100
var target_rot = 0
var double_click = false
func state_input(event):
	if event is InputEventScreenTouch:
		var dis = event.position - head.global_position
		if event.pressed and dis.length() < 30:
			if not double_click:
				$"../../doubleClick".start()
				double_click = true
			else:
				double_click = false
				$"../../sprint".start()
				statemachine.SPEED = 2.5
				$"../../Sprint_sfx".play()
			is_dragging = true
			drag_pos = event.position
			
		if not event.pressed and is_dragging:
			
			$"../../ghost".visible = false
			is_dragging = false
			$"../../head/Line2D".visible = false
			turn()
	if event is InputEventScreenDrag:
		if is_dragging:
			$"../../ghost".visible = true
			$"../../head/Line2D".visible = true
			target = event.position
			rad = statemachine.direction.rotated(PI/2).dot(target - drag_pos) / 2
			var turn_float = statemachine.direction.dot(target - drag_pos) / 2
			#if turn_float > 0:
				#rad = sign(rad) * pow(abs(rad),1.05)
			target_rot = 2 * PI - (sig(turn_float *(sig(rad/220)+1)/150) * 2) * PI
			$"../../head/Path2D".scale =  Vector2(abs(rad) * 2 / 100, rad * 2 /100)
			$"../../head/Path2D/PathFollow2D".progress_ratio = target_rot/ (2 * PI)
			$"../../ghost".global_position = $"../../head/Path2D/PathFollow2D/Node2D".global_position
			$"../../ghost".global_rotation = $"../../head/Path2D/PathFollow2D/Node2D".global_rotation
			var points = $"../../head/Path2D".curve.get_baked_points()
			points = points.slice(0,round(points.size()*target_rot/(2*PI)))
			$"../../head/Line2D".points = points
			$"../../head/Line2D".scale = $"../../head/Path2D".scale
			
func on_enter():
	rad = 0
	target_rot = 0
	double_click = false
			
func turn():
	
	statemachine.turn_info = Vector2(rad,target_rot)
	if abs(rad) > 10:
		next_state = $"../Turn"

func sig(x):
	return 1/(1 + pow(2.718281828,-x))


func _on_timer_timeout():
	double_click = false
	pass # Replace with function body.
