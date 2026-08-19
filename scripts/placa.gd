extends Area2D
## Placa de fim de fase: quando o player chega perto dela, ela deveria
## escrever uma mensagem de fase concluida na tela.


var cerejas_na_fase: int = 5

@onready var mensagem: Label = $Mensagem


func _ready() -> void:
	mensagem.visible = false


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return

	mensagem.text = "Fase concluida! Ao todo eram " + str(cerejas_na_fase) + " cerejas."
	mensagem.visible = true
