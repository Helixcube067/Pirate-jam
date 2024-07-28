extends Node
class_name requestBase
enum {DragonsTooth, LunarCheese, MandrakeSeeds, Alpha, Beta, Gamma, Purple, Green, Orange}
var acceptedItem
@export var dialogue : String
var active : bool = false
var completed : bool = false

func CompleteRequest():
	completed = true
	active = false
	PlayerInventory.lastCraft = null
func TakeRequest():
	active = true
