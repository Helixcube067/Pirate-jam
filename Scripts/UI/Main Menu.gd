extends CanvasLayer

func _on_jam_small_transparent_pressed():
	OS.shell_open("http://itch.io/jam/pirate")

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Overworld/Hub/hub.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
