extends KinematicBody2D

export(float) var attack_time = 1

const dagger_class = preload("res://scene/game/enemy/dagger.tscn")


onready var throw_point = $ThrowPoint


var attack_timer = Timer.new()

func _ready():
	attack_timer.connect("timeout", self, "_on_attack_timer_timeout")
	attack_timer.wait_time = attack_time
	self.add_child(attack_timer)
	attack_timer.start()


func _on_attack_timer_timeout():
	var instance = dagger_class.instance()
	
	instance.position = throw_point.position
	instance.rotation_degrees = -90
	instance.direction = Vector2(-1, 0)
	self.add_child(instance)
	print("ll")