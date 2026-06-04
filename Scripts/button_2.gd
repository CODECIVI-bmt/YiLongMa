extends Button

func _ready():
	# Tạo một StyleBoxFlat mới bằng code
	var style_box = StyleBoxFlat.new()
	style_box.bg_color = Color.AQUA # Đặt màu đỏ
	add_theme_stylebox_override("normal", style_box)
func _on_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level.tscn")
	#get_tree().change_scene_to_file("res://Scenes/Player_and_Bot.tscn")
