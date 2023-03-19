extends Node
class_name MenuNetworkServer

var server_peer = ENetMultiplayerPeer.new()
# Multiplayer global object is only available within tree scene
# It's required for proper multiplayer communication
var _multiplayer = null


const DEFAULT_PORT = 4433
const MAX_PLAYERS = 3

var _server_port = DEFAULT_PORT


func _init(multiplayer, server_port):
	self._multiplayer = multiplayer
	self._server_port = int(server_port)


func start():
	print("server_peer: ", server_peer)
	var create_server_result = server_peer.create_server(self._server_port, MAX_PLAYERS)
	if create_server_result != OK:
		OS.alert("Failed to start multiplayer server.")
		return
	else:
		self._multiplayer.multiplayer_peer = server_peer
		print('Started server on port: ', self._server_port)
		

	

func connect_peer_connected(callback: Callable):
	self._multiplayer.peer_connected.connect(callback)
	

func connect_peer_disconnected(callback: Callable):
	self._multiplayer.peer_disconnected.connect(callback)
