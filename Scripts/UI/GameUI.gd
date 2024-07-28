extends Node
var recipeMenu : Control
var hubMenu : Control
var mixMenu : Control

func _ready():
	recipeMenu = %Recipes
	hubMenu = %"Hub menu"
	mixMenu = %MixMenu
	mixMenu.CloseMixMenu.connect(ClosedMixMenu)
func _on_recipe_button_pressed():
	if(recipeMenu.visible):
		recipeMenu.visible = false
	else:
		recipeMenu.visible = true
func _on_mix_button_pressed():
	hubMenu.visible = false
	recipeMenu.visible = false
	mixMenu.visible = true

func ClosedMixMenu():
	hubMenu.visible = true
