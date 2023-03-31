extends Node2D

var score = 0
var win = false

onready var scorelabel = get_node("CanvasLayer/RichTextLabel")
const WinCondition = preload("res://WinCondition.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_KillPlane_body_entered(body):
	$Player.position.x = 30
	$Player.position.y = 200
	#handle_player_lost()

func _on_coin_coin_collected():
	score = score + 1
	var scoretext = "Score: "+String(score)
	#print(scoretext)
	scorelabel.clear()
	scorelabel.add_text(scoretext)



func _on_flag_flag_entered():
	win = true
	if win == true:
		handle_player_win()
	
func handle_player_win():
	var game_over = WinCondition.instance()
	add_child(game_over)
	game_over.set_title(true)
	get_tree().paused = true
	
func handle_player_lost():
	var game_over = WinCondition.instance()
	add_child(game_over)
	game_over.set_title(false)
	get_tree().paused = true
