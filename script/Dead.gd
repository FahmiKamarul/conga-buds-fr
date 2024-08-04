extends State



func on_enter():
	print("test")
	statemachine.died = true
	$"../../backArea2D".monitoring = false
	print(statemachine.snake.get_parent().name)
	if statemachine.snake.get_parent() :
		print("failed")
		statemachine.snake.get_parent().died(statemachine.snake.name)
	pass
