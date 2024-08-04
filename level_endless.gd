extends Level

func _ready():
	GAMEMANAGER.level_index = -1

var max_length = 1


func _process(delta):
	if not failed:
		for child in get_children():
			if child is Snake:
				max_length = max(max_length,child.length)

		$Goal.text = "Score: " + str(max_length)
