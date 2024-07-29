extends Node

@export var speed = 1.0
#@onready var sprite:AnimatedSprite2D= $AnimatedSprite2D
var enemy:Enemy
var sprite: AnimatedSprite2D
func _ready():
	enemy=get_parent()
	sprite = enemy.get_node("AnimatedSprite2D")
	enemy.health
	pass
	
func _physics_process(delta:float)-> void:
	if GameManager.is_game_over:return
	#Calcula direção
	var player_position: Vector2 = GameManager.player_position
	var diference= player_position - enemy.position
	var input_vector = diference.normalized()
	#Movimentação
	enemy.velocity= input_vector *  speed * 100.0
	enemy.move_and_slide()
	
	#Girar sprite
	if input_vector.x >0:
		sprite.flip_h = false
		
	elif input_vector.x <0:
		sprite.flip_h= true
