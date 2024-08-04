extends Level

func _process(delta):
	$Goal.text = str($snake2.length) + " / 3"
	if $snake2.length == 3:
		complete()
