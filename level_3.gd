extends Level

func _process(delta):
	$CanvasLayer/Goal.text = str($snake2.length) + " / 4"
	if $snake2.length == 4:
		complete()

