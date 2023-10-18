extends Node2D

## VARIABLES
var _dragging : bool
var _start_pos : Vector2
var _last_drag_pos : Vector2

## GODOT CALLBACKS
func _ready():
	pass


func _process(delta):
	pass
	

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not _dragging and event.pressed:
			_on_drag_start(event)
			
		if _dragging and not event.pressed:
			_on_drag_finish(event)

	if event is InputEventMouseMotion and _dragging:
		_on_drag(event)

## IMPLEMENTATION
func _on_drag_start(event) -> void:
	_dragging = true
	_start_pos = position
	_last_drag_pos = event.position;
	$Visuals.scale = Vector2.ONE * 0.9


func _on_drag(event) -> void:
	var delta = event.position - _last_drag_pos
	var new_position = position + delta
	var offset = new_position - _start_pos

	position = _start_pos + offset.limit_length(150)
	
	_last_drag_pos = event.position


func _on_drag_finish(event) -> void:
	_dragging = false
	$Visuals.scale = Vector2.ONE
	
