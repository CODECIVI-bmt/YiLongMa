extends Button

func _ready():
	# Tạo một StyleBoxFlat mới bằng code
	var style_box = StyleBoxFlat.new()
	style_box.bg_color = Color.RED # Đặt màu đỏ
	add_theme_stylebox_override("normal", style_box)

func _on_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game_start.tscn")
