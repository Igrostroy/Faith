extends Node2D




var players = {}

const MAX_PLAYERS = 3
var last_player_id = -1



func _on_start_hosting_button_pressed():
	var server_port = int($PortEdit.text)
	var _network_server = MenuNetworkServer.new(multiplayer, server_port)
	_network_server.start()

	_network_server.connect_peer_connected(_on_peer_connected)
	_network_server.connect_peer_disconnected(_on_peer_disconnected)
	players[_network_server.server_peer] = _network_server.server_peer.get_unique_id()
	_add_player_to_list(_network_server.server_peer)



func _add_player_to_list(peer_id):
	last_player_id += 1
	var player_name = "Player" + str(last_player_id)
	var players_list = $ItemList
	players_list.set_item_text(last_player_id, player_name)
	players[peer_id] = last_player_id



func _on_peer_connected(peer_id):
	print("New player connected: ", peer_id)
	_add_player_to_list(peer_id)

	

func _on_peer_disconnected(peer_id):
	print("Player disconnected: ", peer_id)
	var player_index = players[peer_id]
	players.erase(peer_id)
	var players_list = $ItemList

	players_list.set_item_text(last_player_id, "")
	last_player_id -= 1
	

