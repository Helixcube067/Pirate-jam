extends Node
class_name ItemBase
enum {DragonsTooth, LunarCheese, MandrakeSeeds}
var itemType = null
var description : String
#var isInRange : bool = false

#func _process(delta):
	#if in the area is true
		#if Input.is_action_just_pressed(""):
	#pass
	
func _on_area_2d_body_entered(body):
	#isInRange = true
	if body.name == "Player":
		#if in the area
			#if Input.is_action_just_pressed(""):
		match itemType:
			DragonsTooth:
				if PlayerInventory.inventory.has("Dragon's Tooth"):
					PlayerInventory.inventory["Dragon's Tooth"] += 1
				else:
					PlayerInventory.inventory["Dragon's Tooth"] = 1
			LunarCheese:
				if PlayerInventory.inventory.has("Lunar Cheese"):
					PlayerInventory.inventory["Lunar Cheese"] += 1
				else:
					PlayerInventory.inventory["Lunar Cheese"] = 1
			MandrakeSeeds:
				if PlayerInventory.inventory.has("Mandrake Seeds"):
					PlayerInventory.inventory["Mandrake Seeds"] += 1
				else:
					PlayerInventory.inventory["Mandrake Seeds"] = 1
			_:
				print("This thing was undefined so i cant identify it")
		queue_free()

#just to text logic
func _on_area_2d_mouse_entered():
	match itemType:
		DragonsTooth:
			if PlayerInventory.inventory.has("Dragon's Tooth"):
				PlayerInventory.inventory["Dragon's Tooth"] += 1
			else:
				PlayerInventory.inventory["Dragon's Tooth"] = 1
		LunarCheese:
			if PlayerInventory.inventory.has("Lunar Cheese"):
				PlayerInventory.inventory["Lunar Cheese"] += 1
			else:
				PlayerInventory.inventory["Lunar Cheese"] = 1
		MandrakeSeeds:
			if PlayerInventory.inventory.has("Mandrake Seeds"):
				PlayerInventory.inventory["Mandrake Seeds"] += 1
			else:
				PlayerInventory.inventory["Mandrake Seeds"] = 1
		_:
			print("This thing was undefined so i cant identify it")
	queue_free()
	printt("Dragons: ", PlayerInventory.inventory.get("Dragon's Tooth"))

func CraftAlphaPotion():
	if(PlayerInventory.inventory.get("Lunar Cheese") >= 1 and PlayerInventory.inventory.get("Mandrake Seeds") >= 1):
		if PlayerInventory.inventory.has("Red Alpha Potion"):
			PlayerInventory.inventory["Red Alpha Potion"] += 1
		else:
			PlayerInventory.inventory["Red Alpha Potion"] = 1
		PlayerInventory.inventory["Lunar Cheese"] -= 1
		PlayerInventory.inventory["Mandrake Seeds"] -= 1
	else:
		print("Not enough materials")
		
func CraftBetaPotion():
	if(PlayerInventory.inventory.get("Dragon's Tooth") >= 1 and PlayerInventory.inventory.get("Mandrake Seeds") >= 1):
		if PlayerInventory.inventory.has("Blue Beta Potion"):
			PlayerInventory.inventory["Blue Beta Potion"] += 1
		else:
			PlayerInventory.inventory["Blue Beta Potion"] = 1
		PlayerInventory.inventory["Dragon's Tooth"] -= 1
		PlayerInventory.inventory["Mandrake Seeds"] -= 1
	else:
		print("Not enough materials")
		
func CraftGammaPotion():
	if(PlayerInventory.inventory.get("Lunar Cheese") >= 1 and PlayerInventory.inventory.get("Dragon's Tooth") >= 1):
		if PlayerInventory.inventory.has("Yellow Gamma Potion"):
			PlayerInventory.inventory["Yellow Gamma Potion"] += 1
		else:
			PlayerInventory.inventory["Yellow Gamma Potion"] = 1
		PlayerInventory.inventory["Lunar Cheese"] -= 1
		PlayerInventory.inventory["Dragon's Tooth"] -= 1
	else:
		print("Not enough materials")
