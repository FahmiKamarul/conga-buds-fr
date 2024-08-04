extends Level


func _process(delta):
	$CanvasLayer/Goal.text = str($snake.length) + " / 3"
	if $snake.length == 3:
		complete()
