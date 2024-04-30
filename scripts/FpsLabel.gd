extends Label

func _ready() -> void:
	GlobalSettings.fps_displayed.connect(self._on_fps_displayed)
	#visible = Save.game_data.display_fps

func _process(delta: float) -> void:
	text = "FPS: %s" % [Engine.get_frames_per_second()]

func _on_fps_displayed(valor):  # "valor" en lugar de "value" para claridad
	visible = valor

