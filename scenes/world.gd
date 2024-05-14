extends Node2D
#
#var countdown_timer: Timer
#var game_paused: bool = true
#
#func _ready():
	#countdown_timer = $CountdownTimer
	#countdown_timer.timeout.connect(self._on_timer_timeout)
	#countdown_timer.start()
#
	## Pausa todo el juego
	#pause_game()
#
#func pause_game():
	#game_paused = true
	## Detener procesamiento de lógica y entrada del jugador
	#set_process(false)
	#set_process_input(false)
#
	## Detener las animaciones
	##$AnimatedSprite2D.stop("p_rojo")
	##$AnimatedSprite2D.stop("p_verde")
#
	## También podrías desactivar otros procesos necesarios para la pausa, como efectos de sonido, etc.
#
#func resume_game():
	#game_paused = false
	## Reanudar procesamiento de lógica y entrada del jugador
	#set_process(true)
	#set_process_input(true)
#
	## Reanudar las animaciones
	##$P_ROJO.animation_player.play("nombre_de_la_animacion")
	##$P_VERDE.animation_player.play("nombre_de_la_animacion")
	##$WallManager.animation_player.play("nombre_de_la_animacion")
#
	## Reanudar otros procesos necesarios para el juego
#
#func _on_timer_timeout():
	#countdown_timer.queue_free()
	## Reanuda el juego después de la cuenta regresiva
	#resume_game()
