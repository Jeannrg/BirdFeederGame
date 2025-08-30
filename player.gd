extends CharacterBody2D


const SPEED = 800.0
const JUMP_VELOCITY = -1200.0

var birds = 0
@onready var text = $"../Label"

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	


func _on_bird_area_2d_fed_1() -> void:
	birds += 1
	print (birds)


func _on_bird_2_area_2d_fed_2() -> void:
	birds += 1
	print (birds)

func _on_bird_3_area_2d_fed_3() -> void:
	birds += 1
	print (birds)


func _on_finish_area_2d_body_entered(body: Node2D) -> void:
	if birds != 3:
		text.text = "I don't think I'm ready to leave yet."
	else:
		text.text = "Woohoo! I fed all 3 birds."
