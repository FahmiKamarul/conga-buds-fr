extends Area2D


@onready var timer = $Timer
@onready var mark1 = $target_1
@onready var mark2 = $target_2
@onready var Cols : Array = [$CollisionShape2D, $CollisionShape2D2, $CollisionShape2D3, $CollisionShape2D4]
@export var time_start : float = 4
var snake = preload("res://scene/snake.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start(time_start)
	pass # Replace with function body.

@onready var level = $".."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_bud():
	var snake = snake.instantiate()
	snake.global_position = random_spawnpoint()
	snake.start_dir = random_dir_to_target(snake.position)
	snake.sprite_type = randi_range(0,3)
	snake.SPEED = randf_range(0.9,1.3)
	snake.is_king = true if randf_range(0,10) > 8 else false
	level.add_child(snake)
	pass
	
func random_spawnpoint():
	var i =  randi_range(0, Cols.size()-1)
	
	var col = Cols[i]
	
	var origin = col.global_position
	var size = (col.shape.get_size())/2
	
	var x = randf_range(origin.x - size.x , origin.x + size.x )
	var y = randf_range(origin.y - size.y , origin.y + size.y )
	
	
	return Vector2(x, y)
	
func random_dir_to_target(spawnpoint: Vector2):
	var x = randf_range(mark1.position.x,mark2.position.x)
	var y = randf_range(mark1.position.y,mark2.position.y)
	return Vector2(x,y) - spawnpoint


func _on_timer_timeout():
	spawn_bud()
	timer.start(randf_range(7,16))
	pass # Replace with function body.
