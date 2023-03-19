extends Node2D


const HOST_MENU_NODE_NAME = "HostMenu"
const CONNECTION_ESTABLISHED_SIGNAL = "_on_connection_to_server_established"

const CONNECTED_MESSAGE = "CONNECTED"
const LOADING_MESSAGE = "TRYING TO CONNECT"
const DISCONNECTED_MESSAGE = "DISCONNECTED"

func _on_connect_game_button_pressed():
	var network_client = MenuNetworkClient.new(multiplayer)
	
	var server_ip = $ServerIPEdit.text 
	var server_port = int($ServerPortEdit.text)
	print(server_ip)
	print(server_port)

	var status = network_client.connect_to_server(server_ip, server_port)
	if status == MultiplayerPeer.ConnectionStatus.CONNECTION_CONNECTING:
		$ConnectionStatus.text = "LOADING"
	elif status == MultiplayerPeer.ConnectionStatus.CONNECTION_DISCONNECTED:
		$ConnectionStatus.text = "DISCONNECTED"
		
	network_client.connect_peer_connected(_on_peer_connected)
	network_client.connect_peer_disconnected(_on_peer_disconnected)
	

func _on_peer_connected(peer):
	$ConnectionStatus.text = CONNECTED_MESSAGE
	var root = get_tree().root.get_child(0)
	root.emit_signal(GameRoot.CONNECTED_TO_SERVER_SIGNAL)
	root._on_connection_to_server_established()



func _on_peer_disconnected(peer):
	print('Disconnected')
	$ConnectionStatus.text = DISCONNECTED_MESSAGE
