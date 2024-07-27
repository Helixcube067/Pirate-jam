extends Resource
class_name requestBase

@export var recipe = {}
@export var dialogue : String
var active : bool = false
var completed : bool = false

func CompleteRequest():
	completed = true
	active = false

func TakeRequest():
	active = true
