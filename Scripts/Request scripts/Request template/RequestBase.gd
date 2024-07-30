extends Node
class_name requestBase
enum {DragonsTooth, LunarCheese, MandrakeSeeds, Alpha, Beta, Gamma, Purple, Green, Orange}
var acceptedItem
@export var imagePath : String
@export var requestersName : String
@export var requestersPic : Texture2D
@export var entryDialogue : String
@export var completedDialogue : String
@export var incorrectDialogue : String
var active : bool = false
var completed : bool = false

func CompleteRequest():
	completed = true
	active = false
	PlayerInventory.lastCraft = null
func TakeRequest():
	active = true
