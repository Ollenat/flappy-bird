extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animPlayer = get_node("AnimationPlayer") 

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta
	rotate(velocity.y * 0.0005)
	
	if velocity.y > 0:
		animPlayer.play("Fall")
	
	
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
		animPlayer.play("Flap")
		
	#TODO: Clamp rotaion
	
	move_and_slide()
