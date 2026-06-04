extends Control
signal selected (number: int)
# Gán node Label vào biến (hoặc dùng dấu $ nếu cùng scene)
@onready var my_label = $"."
var hp : int = 10
func _ready():
	update_text_based_on_action(str(hp))
	$"../../../Khung_bai".selected.connect(_on_image_selected_received)
	pass
func _process(delta: float) -> void:
	pass

func update_text_based_on_action(user_name: String):
	# Sử dụng format string để nhúng biến vào văn bản
	my_label.text = "HP: %s" % user_name
	
func _on_image_selected_received(path: String):
	print("Đường dẫn đã nhận được: ", path)
	if path == "res://Assets/2.png" :
		$"../../Player".play("attack")
		hp -= 2
		if(hp <= 0):
			get_tree().change_scene_to_file("res://Scenes/Game_over.tscn")
		update_text_based_on_action(str(hp))
func attack():
	var random_number = randi_range(1,2)
	if (random_number == 1): selected.emit(1)
	if (random_number == 2): 
		$"..".play("heal")
		hp += 1;
		update_text_based_on_action(str(hp))
