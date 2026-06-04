extends Control
# Gán node Label vào biến (hoặc dùng dấu $ nếu cùng scene)
@onready var my_label = $Label
@onready var my_label_2 = $Label2
var hp : int = 10
var mana : int = 5
func _ready():
	update_text_based_on_action(str(hp))
	update_text_based_on_action_2(str(mana))
	$"../../Bot/Label".selected.connect(_on_number_selected_received)
	$"../../../Khung_bai".selected.connect(_on_image_selected_received)

func _on_image_selected_received(path: String):
	print("Đường dẫn đã nhận được: ", path)
	if path == "res://Assets/1.png" :
		$"..".play("heal")
		hp += 2
		update_text_based_on_action(str(hp))
		
func update_text_based_on_action(user_name: String):
	# Sử dụng format string để nhúng biến vào văn bản
	my_label.text = "HP: %s" % user_name
	
func update_text_based_on_action_2(user_name: String):
	# Sử dụng format string để nhúng biến vào văn bản
	my_label_2.text = "Mana: %s" % user_name
	
func _on_number_selected_received(number: int):
	if number == 1:
		$"../../Bot".play("attack")
		if ($"../../../Khung_bai".can_atk == false) : 
			$"..".play("defend")
		else:
			hp -= 3
		update_text_based_on_action(str(hp))
	if(hp <= 0 ):
		get_tree().change_scene_to_file("res://Scenes/Game_over.tscn")
func check_mana(num: int) -> bool:
	return num - mana <= 0 
