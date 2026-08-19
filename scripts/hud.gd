extends CanvasLayer
## HUD que mostra a quantidade de cerejas coletadas.
## Ouve o sinal "score_changed" do autoload GameManager.
var pontuacao: int = 0
@onready var score_label: Label = $MarginContainer/ScoreLabel
var vidas: int = 3

# Variáveis do cronômetro do PowerUp
var tempo_restante: float = 0.0
var velocidade_ativa: bool = false

func _ready() -> void:
	GameManager.score_changed.connect(_on_score_changed)
	_update(GameManager.score)

func _process(delta: float) -> void:
	if velocidade_ativa:
		tempo_restante -= delta
		if tempo_restante > 0.0:
			score_label.text = "Cerejas: %d | Velocidade: %.1fs" % [GameManager.score, tempo_restante]
		else:
			tempo_restante = 0.0
			velocidade_ativa = false
			_update(GameManager.score)

func somar_ponto() -> void:
	pontuacao += 1
	score_label.text = "Pontos:" + str(pontuacao)

func _on_score_changed(new_score: int) -> void:
	_update(new_score)

func _update(value: int) -> void:
	if not velocidade_ativa:
		score_label.text = "Cerejas: %d" % value

func iniciar_cronometro(tempo: float) -> void:
	tempo_restante = tempo
	velocidade_ativa = true
