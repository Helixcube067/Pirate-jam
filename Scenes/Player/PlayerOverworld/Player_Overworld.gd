extends CharacterBody2D

const SPEED = 1
const JUMP_VELOCITY = -400.0
var direction = "0"
var animation_state
var direction_string = "down"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$Char.play("idle_down")

func _physics_process(delta):
	direction = Input.get_vector("game_left", "game_right", "game_up", "game_down")
	animation_state = "idle"

	var speed_multiplier = 1;

	if Input.is_action_pressed("game_run"):
		speed_multiplier = 2;
		
	if direction:
		animation_state = "walk"
		direction_string = VectorToDirection(direction)
		print(direction_string)
		
		position += direction.normalized() * SPEED * speed_multiplier;

	if $Char.animation != animation_state + direction_string:
		PlayAnimation(animation_state + "_" + direction_string)
		$Char.speed_scale = speed_multiplier;


func PlayAnimation(anim):
	$Char.play(anim)
	$Shadow.play(anim)

func VectorToDirection(direction_to_convert):
	var angle = rad_to_deg(direction_to_convert.angle()) + 90
	print(angle)

	if angle < -22.5:
		return "upleft"
	if angle < 22.5:
		return "up"
	if angle < 67.5:
		return "upright"
	if angle < 112.5:
		return "right"
	if angle < 157.5:
		return "downright"
	if angle < 202.5:
		return "down"
	if angle < 247.5:
		return "downleft"
	if angle < 292.5:
		return "left"
	if angle < 337.5:
		return "upleft"
	if angle < 360:
		return "up"

	return "left"
