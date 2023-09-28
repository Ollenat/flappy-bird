extends Node2D


@export var speed : float = 5
@export var direction : Vector2 = Vector2(-1, 0)

func _physics_process(delta):
	position += direction * speed
