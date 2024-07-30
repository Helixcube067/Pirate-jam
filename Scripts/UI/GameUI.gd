extends Node
var recipeMenu : Control
var hubMenu : Control
var mixMenu : Control
var pic : TextureRect

func _ready():
	pic = %"Requesters pic"
	recipeMenu = %Recipes
	hubMenu = %"Hub menu"
	mixMenu = %MixMenu
	mixMenu.CloseMixMenu.connect(ClosedMixMenu)
	recipeMenu.CloseRecipeMenu.connect(ShowRequester)
func _on_recipe_button_pressed():
	if(recipeMenu.visible):
		recipeMenu.visible = false
		pic.visible = true
	else:
		recipeMenu.visible = true
		pic.visible = false
func _on_mix_button_pressed():
	hubMenu.visible = false
	recipeMenu.visible = false
	mixMenu.visible = true
	pic.visible = false

func ClosedMixMenu():
	hubMenu.visible = true
	pic.visible = true

func ShowRequester():
	pic.visible = true
