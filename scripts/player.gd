extends CharacterBody2D

const speed = 100
var current_dir = "none"

func _physics_process(delta: float) -> void:
	player_move(delta)
	
func player_move(delta: float) -> void:
	
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("right_move"):
		current_dir = "right"
		play_animation(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left") or Input.is_action_pressed("left_move"):
		current_dir = "left"
		play_animation(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_up") or Input.is_action_pressed("up_move"):
		current_dir = "up"
		play_animation(1)
		velocity.x = 0
		velocity.y = -speed
	elif Input.is_action_pressed("ui_down") or Input.is_action_pressed("down_move"):
		current_dir = "down"
		play_animation(1)
		velocity.x = 0
		velocity.y = speed
	else:
		play_animation(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()

# 0 for idle state, 1 for walking
func play_animation(movement: int) -> void:
	var dir = current_dir
	var animation = $AnimatedSprite2D
	
	if dir == "right":
		animation.flip_h = false
		if movement == 0:
			animation.play("side_idle")
		elif movement == 1:
			animation.play("side_walk")
			
	elif dir == "left":
		animation.flip_h = true
		if movement == 0:
			animation.play("side_idle")
		elif movement == 1:
			animation.play("side_walk")
		
	elif dir == "up":
		animation.flip_h = false
		if movement == 0:
			animation.play("up_idle")
		elif movement == 1:
			animation.play("up_walk")
		
	elif dir == "down":
		animation.flip_h = true
		if movement == 0:
			animation.play("down_idle")
		elif movement == 1:
			animation.play("down_walk")
