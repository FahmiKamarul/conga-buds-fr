extends Area2D


func _on_body_entered(body):
	if body is bud:
		if body.is_head:
			body.out_of_bound(true)
	pass # Replace with function body.
	
func _on_body_exited(body):
	if body is bud:
		if body.is_head:
			body.out_of_bound(false)
	pass # Replace with function body.
