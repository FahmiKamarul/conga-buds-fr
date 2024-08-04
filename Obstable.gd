extends Area2D

@export var lifetime: float = 0

func _ready():
	if lifetime > 0:
		$Timer.start(lifetime)
	$AnimationPlayer.play("pop_in")
	
func set_lifetime(lifetime: float):
	if lifetime > 0:
		$Timer.start(lifetime)
	$AnimationPlayer.play("pop_in")

# Called when the node enters the scene tree for the first time.
func _on_body_entered(body):
	if body is bud:
		if body.is_head:
			body.hit()
	pass # Replace with function body.


func _on_timer_timeout():
	$AnimationPlayer.play("pop_out")
	print("test")
	pass # Replace with function body.
