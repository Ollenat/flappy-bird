extends Node

@export var delete_pipe_area : Area2D
@export var pipe_spawn_point : Node2D

@export var pipe_spawn_offset_max : Vector2
@export var pipe_spawn_offset_min : Vector2
@export var pipe_spawn_timer : Timer

@export_file var pipe_scene_path : String
var pipe_packed : PackedScene


func _ready():
	pipe_packed = load(pipe_scene_path)
	pipe_spawn_timer.timeout.connect(spawn_pipe)

func spawn_pipe():
	var new_pipe = pipe_packed.instantiate() as Node2D
	new_pipe.position = pipe_spawn_point.position
	add_child(new_pipe)
