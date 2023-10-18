extends Node2D

## VARIABLES
var startPos : Vector2
var startDragPos : Vector2
var lastDragPos : Vector2
var dragging = false

## GODOT CALLBACKS
func _ready():
	pass


func _process(delta):
	pass
	

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not dragging and event.pressed:
			dragging = true
			onDragStart(event)
			
		if dragging and not event.pressed:
			dragging = false
			OnDragFinish(event)

	if event is InputEventMouseMotion and dragging:
		onDrag(event)

## IMPLEMENTATION
func onDragStart(event):
	startPos = position
	startDragPos = event.position;
	lastDragPos = event.position;
	$Visuals.scale = Vector2.ONE * 0.9


func onDrag(event):
	var delta = event.position - lastDragPos
	var newPosition = position + delta
	var offset = newPosition - startPos

	newPosition = startPos + offset.limit_length(150)
		
	position = newPosition
	
	lastDragPos = event.position


func OnDragFinish(event):
	$Visuals.scale = Vector2.ONE
	
