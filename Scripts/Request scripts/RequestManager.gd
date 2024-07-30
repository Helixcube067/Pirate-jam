extends Node

@export var requests : Array[requestBase] = []
var currentRequest : requestBase
var requestText : RichTextLabel
var picSlot : TextureRect
var requester : Label
func _ready():
	requester = %"Requester name"
	requestText = %"Request text"
	picSlot = %"Requesters pic"
	requests.shuffle()
	UpdateRequests()
	
func UpdateRequests():
	if(requests.size() > 0):
		currentRequest = requests.pop_front()
		requester.text = currentRequest.requestersName
		requestText.text = currentRequest.entryDialogue
		picSlot.texture = currentRequest.requestersPic
	else:
		#credits
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
