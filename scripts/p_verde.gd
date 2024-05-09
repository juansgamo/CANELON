extends CharacterBody2D

const GRAVITY = 1000.0
var half_screen_height = 0 # Calcula la mitad de la altura de la pantalla

func _ready():
	$AnimatedSprite2D2.play("p_verde")
	$"../fondo".play()
	
# Define el umbral de distancia desde el borde antes de que ocurra el cambio de escena
const BORDER_THRESHOLD = 100

func _physics_process(delta):
	rotation = velocity.y / 2000
	velocity.y += GRAVITY * delta

	# Obtener el tamaño de la pantalla
	var screen_size = get_viewport_rect().size

	# Comprobar si el nodo está fuera del borde superior o inferior
	if position.y > (screen_size.y + BORDER_THRESHOLD) or position.y < -BORDER_THRESHOLD:
		get_tree().change_scene_to_file("res://scenes/menu_multijugador.tscn")
		
	move_and_slide()
	
func _input(event):
	if event.is_action_pressed("ui_right"):
		$"../JumpSound".play()
		velocity.y = -500   
	
	
