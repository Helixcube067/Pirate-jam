extends Node

@export var requests : Array[requestBase] = []
@export var secondRequests : Array[requestBase] = []
var currentRequest : requestBase
var requestText : RichTextLabel
var picSlot : TextureRect
var requester : Label
func _ready():
	requester = %"Requester name"
	requestText = %"Request text"
	picSlot = %"Requesters pic"
	requests.shuffle()
	secondRequests.shuffle()
	UpdateRequests()
	
func UpdateRequests():
	if(secondRequests.size() > 0):
		if(requests.size() > 0):
			currentRequest = requests.pop_front()
			requester.text = currentRequest.requestersName
			requestText.text = currentRequest.entryDialogue
			picSlot.texture = currentRequest.requestersPic
		else:
			currentRequest = secondRequests.pop_front()
			requester.text = currentRequest.requestersName
			requestText.text = currentRequest.entryDialogue
			picSlot.texture = currentRequest.requestersPic
	else:
		await get_tree().create_timer(2.5).timeout
		get_tree().change_scene_to_file("res://Scenes/PregameMenus/Main Menu/Main Menu.tscn")
		pass

func _on_give_button_pressed():
	if(PlayerInventory.lastCraft == null):
		pass
	else:
		if(PlayerInventory.lastCraft == currentRequest.acceptedItem):
			requestText.text = currentRequest.completedDialogue
			await get_tree().create_timer(2.5).timeout
			UpdateRequests()
		else:
			requestText.text = currentRequest.incorrectDialogue
