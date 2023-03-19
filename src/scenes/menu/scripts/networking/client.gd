extends Node
class_name MenuNetworkClient

var client_peer = ENetMultiplayerPeer.new()

var _multiplayer = null
var _server_ip = null
var _server_port = null


func _init(multiplayer):
	self._multiplayer = multiplayer

func connect_to_server(
		server_ip: String, server_port: int,
	) -> MultiplayerPeer.ConnectionStatus:
	self._server_ip = server_ip
	self._server_port = server_port
	
	print("client_peer: ", client_peer)
	var create_client_status = client_peer.create_client(server_ip, server_port)
	var connection_status = client_peer.get_connection_status()
	if create_client_status != OK:
		OS.alert("Failed to start multiplayer client.")
		return connection_status
	self._multiplayer.multiplayer_peer = client_peer
	
	return connection_status
	

func connect_peer_connected(callback: Callable):
	print("Connected to server: " + str(self._server_ip) + ":" + str(self._server_port))
	self._multiplayer.peer_connected.connect(callback)
	

func connect_peer_disconnected(callback: Callable):
	self._multiplayer.peer_disconnected.connect(callback)
