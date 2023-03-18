extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_connect_game_button_pressed():
	var network_client = MenuNetworkClient.new()
	
	var server_ip = $ServerIPEdit.text 
	var server_port = int($ServerPortEdit.text)
	print(server_ip)
	print(server_port)

	network_client.connect_to_server(server_ip, server_port)
	multiplayer.multiplayer_peer = network_client.client_peer

