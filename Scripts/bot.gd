extends AnimatedSprite2D

func _ready():
	# Kết nối tín hiệu khi animation kết thúc
	self.animation_finished.connect(_on_animation_finished)

func _on_animation_finished():
	# Sau khi chạy xong "attack", tự động quay về "idle"
	if self.animation == "attack" or self.animation == "heal":
		self.play("default")
