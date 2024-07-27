extends CanvasLayer

enum MENU_POINTS {NEW_GAME, LOAD_GAME, OPTIONS, EXIT, PIRATE}
var current_menu_option = 0
var old_menuoption

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	print("CurrentMenu: %s" % current_menu_option)
	$Label.text = "%s" % MENU_POINTS.keys()[current_menu_option]
	if Input.is_action_pressed("game_east"):
		match current_menu_option:
			MENU_POINTS.NEW_GAME:
				print("New Game")
				get_tree().change_scene_to_file("res://Scenes/GameScene.tscn")
		
			MENU_POINTS.LOAD_GAME:
				print("Load Game")
				get_tree().change_scene_to_file("res://Scenes/GameScene.tscn")

			MENU_POINTS.OPTIONS:
				print("Options")
				get_tree().change_scene_to_file("res://Scenes/PreGameMenus/Options.tscn")

			MENU_POINTS.PIRATE:
				print("Pirate Website")
				OS.shell_open("http://itch.io/jam/pirate")

	if Input.is_action_just_pressed("game_down"):
		if current_menu_option == 3 || current_menu_option == 4:
			current_menu_option = 0
		else:
			current_menu_option += 1
		
	if Input.is_action_just_pressed("game_up"):
		if current_menu_option == 0 || current_menu_option == 4:
			current_menu_option = 3
		else:
			current_menu_option -= 1

	
	print("OLD: %s" % old_menuoption)

	if Input.is_action_just_pressed("game_right"):
		if current_menu_option != 4:
			old_menuoption = current_menu_option
			current_menu_option = 4

	if Input.is_action_just_pressed("game_left"):
		if current_menu_option == 4:
			current_menu_option = old_menuoption


func _on_jam_small_transparent_pressed():
	OS.shell_open("http://itch.io/jam/pirate")