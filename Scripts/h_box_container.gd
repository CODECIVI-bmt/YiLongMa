extends HBoxContainer


func _ready():
	# Duyệt qua tất cả các node con nằm trong HBoxContainer
	for child in get_children():
		# Kiểm tra nếu node con là một TextureButton
		if child is TextureButton:
			var random_number = randi_range(1,3)
			var path = load("res://assets/%d.png" % random_number)
			child.texture_normal = path
			# Kết nối signal 'pressed' của node con tới một hàm ở node cha
			# .bind(child) giúp chúng ta biết được chính xác nút nào vừa được nhấn
			child.pressed.connect(_on_any_button_pressed.bind(child))

func _on_any_button_pressed(button_node: TextureButton):
	for child in get_children():
		var random_number = randi_range(1,3)
		var path = load("res://assets/0.png")
		child.texture_normal = path
	await get_tree().create_timer(0.5).timeout
	# Logic quản lý tập trung:
	# Ví dụ: làm tất cả các nút mờ đi, chỉ nút được chọn là sáng lên
	for child in get_children():
		var random_number = randi_range(1,3)
		var path = load("res://assets/%d.png" % random_number)
		child.texture_normal = path
		
