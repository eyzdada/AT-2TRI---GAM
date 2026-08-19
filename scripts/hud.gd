extends CanvasLayer
## HUD que mostra a quantidade de cerejas coletadas.
## Ouve o sinal "score_changed" do autoload GameManager.
var pontuacao: int = 0
@onready var score_label: Label = $MarginContainer/ScoreLabel
var vidas: int = 3

func _ready() -> void:
	GameManager.score_changed.connect(_on_score_changed)
	_update(GameManager.score)
func somar_ponto() -> void:
	pontuacao += 1
	score_label.text = "Pontos:" + str(pontuacao)

func _on_score_changed(new_score: int) -> void:
	_update(new_score)
func vida_perso() -> void:
	vidas -= 3
	score_label.text = "Vidas" + str(vidas)
	

func _update(value: int) -> void:
	score_label.text = "Cerejas: %d" % value
