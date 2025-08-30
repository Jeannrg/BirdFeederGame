extends Area2D

var following = null
signal fed1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if following != null:
		var target_pos = following.global_position + Vector2(15, 0)
		var speed = 800.0
		global_position = global_position.move_toward(target_pos, speed * delta)

func _on_body_entered(body):
	if body.name == "Player" && following == null:
		following = body
		emit_signal("fed1")

		
