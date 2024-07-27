extends Node
class_name ItemBase
enum {DragonsClaw, Tears, Worms}
var itemType = null
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
			DragonsClaw:
				PlayerInventory.dragonClawQuant += 1
			Tears:
				PlayerInventory.tearQuant += 1
			Worms:
				PlayerInventory.wormsQuant += 1
			_:
				print("This thing was undefined so i cant identify it")
		free()

#just to text logic
func _on_area_2d_mouse_entered():
	match itemType:
		DragonsClaw:
			PlayerInventory.dragonClawQuant += 1
		Tears:
			PlayerInventory.tearQuant += 1
		Worms:
			PlayerInventory.wormsQuant += 1
		_:
			print("This thing was undefined so i cant identify it")
	queue_free()
	printt("Dragons: ", PlayerInventory.dragonClawQuant)
	printt("Tears: ", PlayerInventory.tearQuant)
