extends Node
signal CloseMixMenu
var recipeMenu : Control
var mixSlot1 : Label
var mixSlot2 : Label
var resultsSlot : Label
var alphaButton : Button
var betaButton : Button
var gammaButton : Button
var item1 = null
var item2 = null
var item1PicSlot : TextureRect
var item2PicSlot : TextureRect
var resultsPicSlot : TextureRect
@export var dragonPic : Texture2D
@export var cheesePic : Texture2D
@export var seedPic : Texture2D
@export var alphaPic : Texture2D
@export var betaPic : Texture2D
@export var gammaPic : Texture2D
@export var purplePic : Texture2D
@export var greenPic : Texture2D
@export var orangePic : Texture2D
enum {DragonsTooth, LunarCheese, MandrakeSeeds, Alpha, Beta, Gamma, Purple, Green, Orange}

func _ready():
	recipeMenu = %Recipes
	mixSlot1 = %MixSlot1
	mixSlot2 = %MixSlot2
	resultsSlot = %Results
	alphaButton = %"Alpha button"
	betaButton = %"Beta button"
	gammaButton = %"Gamma button"
	item1PicSlot = %Mixslot1Texture
	item2PicSlot = %Mixslot2Texture
	resultsPicSlot = %ResultsslotTexture
	mixSlot1.text = ""
	mixSlot2.text = ""
	resultsSlot.text = ""
func _process(_delta):
	AlphaCheck()
	BetaCheck()
	GammaCheck()
	
func _on_recipe_button_pressed():
	recipeMenu.visible = true
func CraftAlphaPotion():
	#if(PlayerInventory.inventory.get("Lunar Cheese") >= 1 and PlayerInventory.inventory.get("Mandrake Seeds") >= 1):
		if PlayerInventory.inventory.has("Red Alpha Potion"):
			PlayerInventory.inventory["Red Alpha Potion"] += 1
		else:
			PlayerInventory.inventory["Red Alpha Potion"] = 1
		#PlayerInventory.inventory["Lunar Cheese"] -= 1
		#PlayerInventory.inventory["Mandrake Seeds"] -= 1
	#else:
		#print("Not enough materials")
		PlayerInventory.lastCraft = Alpha
		#resultsPicSlot.texture = alphaPic
func CraftBetaPotion():
	#if(PlayerInventory.inventory.get("Dragon's Tooth") >= 1 and PlayerInventory.inventory.get("Mandrake Seeds") >= 1):
		if PlayerInventory.inventory.has("Blue Beta Potion"):
			PlayerInventory.inventory["Blue Beta Potion"] += 1
		else:
			PlayerInventory.inventory["Blue Beta Potion"] = 1
		#PlayerInventory.inventory["Dragon's Tooth"] -= 1
		#PlayerInventory.inventory["Mandrake Seeds"] -= 1
	#else:
		#print("Not enough materials")
		PlayerInventory.lastCraft = Beta
		#resultsPicSlot.texture = betaPic
func CraftGammaPotion():
	#if(PlayerInventory.inventory.get("Lunar Cheese") >= 1 and PlayerInventory.inventory.get("Dragon's Tooth") >= 1):
		if PlayerInventory.inventory.has("Yellow Gamma Potion"):
			PlayerInventory.inventory["Yellow Gamma Potion"] += 1
		else:
			PlayerInventory.inventory["Yellow Gamma Potion"] = 1
		#PlayerInventory.inventory["Lunar Cheese"] -= 1
		#PlayerInventory.inventory["Dragon's Tooth"] -= 1
	#else:
		#print("Not enough materials")
		PlayerInventory.lastCraft = Gamma
		#resultsPicSlot.texture = gammaPic
func CraftPurplePotion():
	if(PlayerInventory.inventory.get("Red Alpha Potion") >= 1 and PlayerInventory.inventory.get("Blue Beta Potion") >= 1):
		if PlayerInventory.inventory.has("Purple Potion"):
			PlayerInventory.inventory["Purple Potion"] += 1
		else:
			PlayerInventory.inventory["Purple Potion"] = 1
		PlayerInventory.inventory["Red Alpha Potion"] -= 1
		PlayerInventory.inventory["Blue Beta Potion"] -= 1
	else:
		print("Not enough materials")
	PlayerInventory.lastCraft = Purple
	#resultsPicSlot.texture = purplePic
	
func CraftOrangePotion():
	if(PlayerInventory.inventory.get("Red Alpha Potion") >= 1 and PlayerInventory.inventory.get("Yellow Gamma Potion") >= 1):
		if PlayerInventory.inventory.has("Orange Potion"):
			PlayerInventory.inventory["Orange Potion"] += 1
		else:
			PlayerInventory.inventory["Orange Potion"] = 1
		PlayerInventory.inventory["Red Alpha Potion"] -= 1
		PlayerInventory.inventory["Yellow Gamma Potion"] -= 1
	else:
		print("Not enough materials")
	PlayerInventory.lastCraft = Orange
	#resultsPicSlot.texture = orangePic
	
func CraftGreenPotion():
	if(PlayerInventory.inventory.get("Blue Beta Potion") >= 1 and PlayerInventory.inventory.get("Yellow Gamma Potion") >= 1):
		if PlayerInventory.inventory.has("Green Potion"):
			PlayerInventory.inventory["Green Potion"] += 1
		else:
			PlayerInventory.inventory["Green Potion"] = 1
		PlayerInventory.inventory["Blue Beta Potion"] -= 1
		PlayerInventory.inventory["Yellow Gamma Potion"] -= 1
	else:
		print("Not enough materials")
	PlayerInventory.lastCraft = Green
	#resultsPicSlot.texture = greenPic
	
func _on_back_button_pressed():
	self.visible = false
	emit_signal("CloseMixMenu")
func _on_dragon_button_pressed():
	if(item1 != null and item1 != DragonsTooth):
		mixSlot2.text = "Dragon's Tooth"
		item2 = DragonsTooth
		#item2PicSlot.texture = dragonPic
	else:
		mixSlot1.text = "Dragon's Tooth"
		item1 = DragonsTooth
		#item2PicSlot.texture = dragonPic
	resultsSlot.text = ""
func _on_lunar_button_pressed():
	resultsSlot.text = ""
	if(item1 != null and item1 != LunarCheese):
		mixSlot2.text = "Lunar Cheese"
		item2 = LunarCheese
		#item2PicSlot.texture = cheesePic
	else:
		mixSlot1.text = "Lunar Cheese"
		item1 = LunarCheese
		#item1PicSlot.texture = cheesePic

func _on_mandrake_button_pressed():
	resultsSlot.text = ""
	if(item1 != null and item1 != MandrakeSeeds):
		mixSlot2.text = "Mandrake Seeds"
		item2 = MandrakeSeeds
		#item2PicSlot.texture = seedPic
	else:
		mixSlot1.text = "Mandrake Seeds"
		item1 = MandrakeSeeds
		#item1PicSlot.texture = seedPic
		
func _on_alpha_button_pressed():
	resultsSlot.text = ""
	if(item1 != null and item1 != Alpha):
		mixSlot2.text = "Red Alpha Potion"
		item2 = Alpha
		#item2PicSlot.texture = alphaPic
	else:
		mixSlot1.text = "Red Alpha Potion"
		item1 = Alpha
		#item1PicSlot.texture = alphaPic

func _on_beta_button_pressed():
	resultsSlot.text = ""
	if(item1 != null and item1 != Beta):
		mixSlot2.text = "Blue Beta Potion"
		item2 = Beta
		#item2PicSlot.texture = betaPic
	else:
		mixSlot1.text = "Blue Beta Potion"
		item1 = Beta
		#item2PicSlot.texture = betaPic
		
func _on_gamma_button_pressed():
	resultsSlot.text = ""
	if(item1 != null and item1 != Gamma):
		mixSlot2.text = "Yellow Gamma Potion"
		item2 = Gamma
		#item2PicSlot.texture = gammaPic
	else:
		mixSlot1.text = "Yellow Gamma Potion"
		item1 = Gamma
		#item1PicSlot.texture = gammaPic
func AlphaCheck():
	if PlayerInventory.inventory.has("Red Alpha Potion"):
		if(PlayerInventory.inventory.get("Red Alpha Potion") >= 1):
			alphaButton.visible = true
		else:
			alphaButton.visible = false
	else:
		alphaButton.visible = false
		
func BetaCheck():
	if PlayerInventory.inventory.has("Blue Beta Potion"):
		if(PlayerInventory.inventory.get("Blue Beta Potion") >= 1):
			betaButton.visible = true
		else:
			betaButton.visible = false
	else:
		betaButton.visible = false
	
func GammaCheck():
	if PlayerInventory.inventory.has("Yellow Gamma Potion"):
		if(PlayerInventory.inventory.get("Yellow Gamma Potion") >= 1):
			gammaButton.visible = true
		else:
			gammaButton.visible = false
	else:
		gammaButton.visible = false

func _on_mix_button_pressed():
	if(item1 == null or item2 == null):
		print("this cant be done")
	elif(item1 == MandrakeSeeds):
		match item2:
			LunarCheese:
				CraftAlphaPotion()
				resultsSlot.text = "Red Alpha Potion"
				#post image here
			DragonsTooth:
				CraftBetaPotion()
				resultsSlot.text = "Blue Beta Potion"
				#image here
	elif(item1 == DragonsTooth):
		match item2:
			MandrakeSeeds:
				CraftBetaPotion()
				resultsSlot.text = "Blue Beta Potion"
				#image here
			LunarCheese:
				resultsSlot.text = "Yellow Gamma Potion"
				CraftGammaPotion()
				#image here
	elif(item1 == LunarCheese):
		match item2:
			MandrakeSeeds:
				CraftAlphaPotion()
				resultsSlot.text = "Red Alpha Potion"
				#post image here
			DragonsTooth:
				resultsSlot.text = "Yellow Gamma Potion"
				CraftGammaPotion()
				#image here
	elif(item1 == Alpha):
		if(item2 == Beta):
			CraftPurplePotion()
			resultsSlot.text = "Purple Potion"
			#image
		elif(item2 == Gamma):
			CraftOrangePotion()
			resultsSlot.text = "Orange Potion"
			#image
		else:	
			print("Incorrect")
	elif(item1 == Beta):
		if(item2 == Gamma):
			CraftGammaPotion()
			resultsSlot.text = "Green Potion"
			#image
		elif(item2 == Alpha):
			CraftPurplePotion()
			resultsSlot.text = "Purple Potion"
			#image
		else:
			print("Incorrect")
	elif(item1 == Gamma):
		if(item2 == Beta):
			CraftGammaPotion()
			resultsSlot.text = "Green Potion"
			#image
		elif(item2 == Alpha):
			CraftPurplePotion()
			resultsSlot.text = "Orange"
			#image
		else:
			print("Incorrect")
	mixSlot1.text = ""
	mixSlot2.text = ""
	item1 = null
	item2 = null
	item1PicSlot = null
	item2PicSlot = null
