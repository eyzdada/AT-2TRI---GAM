extends Area2D

@export var velocidade_extra: float = 150.0
@export var duracao: float = 5.0

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
	# Se tiver uma animação configurada no AnimatedSprite2D, dá play nela
	if $AnimatedSprite2D.sprite_frames and $AnimatedSprite2D.sprite_frames.has_animation("default"):
		$AnimatedSprite2D.play("default")

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("adicionar_velocidade_temporaria"):
		body.adicionar_velocidade_temporaria(velocidade_extra, duracao)
		
		hide()
		set_deferred("monitoring", false)
		queue_free()
