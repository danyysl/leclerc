extends Area2D

signal hit

func _ready():
	GHUD.mob_counter = GHUD.mob_counter + 1
	var collisions = [
		$BlueCollision,
		$RedCollision,
		$CollisionCono1,
		$CollisionTire1,
		$CollisionCono2,
		$CollisionTire2,
		$CollisionRock
	]
	var sprites = [
		$BlueSprite,
		$RedSprite,
		$SpriteCono1,
		$SpriteTire1,
		$SpriteCono2,
		$SpriteTire2,
		$SpriteRock
	]
	var random_int = randi() % collisions.size()
	
	var selected_collision = collisions[random_int]
	var selected_sprite = sprites[random_int]
	
	selected_collision.visible = true
	selected_collision.disabled = false
	selected_sprite.visible = true


func _on_visible_on_screen_notifier_2d_screen_exited():
	if GHUD.mob_counter > 0:
		GHUD.mob_counter = GHUD.mob_counter - 1
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("charles_player"):
		hit.emit()
