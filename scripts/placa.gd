extends Area2D
## Placa de fim de fase: quando o player chega perto dela, ela deveria
## escrever uma mensagem de fase concluida na tela.


var cerejas_na_fase = 5


@onready var Mensagem: Label = $Arbusto
@onready var label_mensagem: Label = $Mensagem

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return

	Mensagem.text = "Fase concluida! Ao todo eram " + cerejas_na_fase + " cerejas."


func _on_mensagem_focus_entered() -> void:
	Mensagem 
	label_mensagem.text = "Mensagem.text" +str(Mensagem)# Replace with function body.
