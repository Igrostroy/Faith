extends Node2D




var players = {}

const MAX_PLAYERS = 3



func _on_start_hosting_button_pressed():
	var _network_server = MenuNetworkServer.new(multiplayer)
	_network_server.start()

	_network_server.connect_peer_connected(_on_peer_connected)
	_network_server.connect_peer_disconnected(_on_peer_disconnected)
	players[_network_server.server_peer] = _network_server.server_peer.get_unique_id()


func _on_peer_connected(peer_id):
	print("New player connected: ", peer_id)
	var number_of_players = len(players) 
	var next_player_number = number_of_players + 1
	
	
	players[peer_id] = next_player_number
	
	var node_name = "Player" + str(next_player_number) + "Name"
	var player_name_slot = get_node(node_name)
	player_name_slot.text = "Player" + str(next_player_number)
	

func _on_peer_disconnected(peer_id):
	print("Player disconnected: ", peer_id)
	var player_number = players[peer_id]
	players.erase(peer_id)
	var node_name = "Player" + str(player_number) + "Name"
	var player_name_slot = get_node(node_name)
	player_name_slot.text = ""

