extends Area2D

@onready var timer = $Timer
@onready var col = $CollisionShape2D
@onready var time_start = 10
@onready var campfire = preload("res://campfire.tscn")
@onready var warning = $Sprite2D
var campfires : Array[Node] = []
@onready var level = $".."
var pos_cf : Vector2

func random_spawnpoint():
	var origin = col.global_position
	var size = (col.shape.get_size())/2
	
	var x = randf_range(origin.x - size.x , origin.x + size.x )
	var y = randf_range(origin.y - size.y , origin.y + size.y )
	
	return Vector2(x,y)
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start(time_start)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_warning():
	var pos = random_spawnpoint()
	warning.global_position = pos
	pos_cf = pos
	$AnimationPlayer.play("warn")

func spawn_campfire():
	var cf = campfire.instantiate()
	level.add_child(cf)
	cf.global_position = pos_cf
	cf.set_lifetime(randf_range(10,20))
	pass

func _on_timer_timeout():
	set_warning()
	pass # Replace with function body.
