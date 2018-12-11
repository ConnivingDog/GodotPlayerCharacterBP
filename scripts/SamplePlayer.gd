extends KinematicBody2D

#floor normal (up direction) default value
const UP = Vector2(0,-1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -500


var motion = Vector2()

func _physics_process(delta):
	
	motion.y += GRAVITY
	
	#check project settings for keys associated with the ff actions
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	
	#resets motion when collides
	motion = move_and_slide(motion,UP)
