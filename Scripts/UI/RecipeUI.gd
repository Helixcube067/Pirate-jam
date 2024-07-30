extends Node

signal CloseRecipeMenu

func _on_button_pressed():
	self.visible = false
	emit_signal("CloseRecipeMenu")
	print("Clicked")
