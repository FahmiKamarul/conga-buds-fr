extends Area2D

@onready var statemachine = $"../StateMachine"
# Called when the node enters the scene tree for the first time.


func _on_body_entered(body):
	if body is bud:
		if body.is_head:
			if body != statemachine.head:
				print("head")
				statemachine.add_buds(body.combine())
	pass # Replace with function body.
