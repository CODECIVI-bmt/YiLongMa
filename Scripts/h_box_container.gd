extends HBoxContainer
signal selected (path: String)
var list: Array[String]
var num: int = 0
var can_atk: bool = true
func _ready():
	for child in get_children():
		if child is TextureButton:
			var random_number = randi_range(1,3)
			if (child.name != "TextureButton4"):
				var path = load("res://Assets/%d.png" % random_number)
				child.texture_normal = path
			else:
				var path = load("res://Assets/0.png")
				child.texture_normal = path
			child.pressed.connect(_on_any_button_pressed.bind(child))
	
func _on_any_button_pressed(button_node: TextureButton):
	var but = button_node.texture_normal
	if (button_node.name != "TextureButton4" ):
		if ($"../Player_Bot/Player/VBoxContainer".check_mana(1)) :
			num += 1
			var path = load("res://Assets/0.png")
			button_node.texture_normal = path
			if (but.resource_path == "res://Assets/3.png"):
				can_atk = false
			selected.emit(but.resource_path)
			$"../Player_Bot/Player/VBoxContainer".mana = $"../Player_Bot/Player/VBoxContainer".mana - 1
			$"../Player_Bot/Player/VBoxContainer".update_text_based_on_action_2(str($"../Player_Bot/Player/VBoxContainer".mana))
		else:
			$"../Label".text = "Không đủ mana"
			await get_tree().create_timer(2.0).timeout
			$"../Label".text = ""
			
	else :
		$"../Player_Bot/Bot/Label".attack()
		can_atk = true
		$"../Player_Bot/Player/VBoxContainer".mana = $"../Player_Bot/Player/VBoxContainer".mana + 1
		$"../Player_Bot/Player/VBoxContainer".update_text_based_on_action_2(str($"../Player_Bot/Player/VBoxContainer".mana))
		num = 0
		for child in get_children():
			var random_number = randi_range(1,3)
			if (child.name != "TextureButton4"):
				var path = load("res://Assets/%d.png" % random_number)
				child.texture_normal = path
			else:
				var path = load("res://Assets/0.png")
				child.texture_normal = path
		
		
