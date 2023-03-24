extends Node
class_name MenuNetworkServer

var server_peer = ENetMultiplayerPeer.new()
# Multiplayer global object is only available within tree scene
# It's required for proper multiplayer communication
var _multiplayer = null


const DEFAULT_PORT = 4433
const MAX_PLAYERS = 3

var _server_port = DEFAULT_PORT
var _is_running = false


func _init(multiplayer, server_port):
	self._multiplayer = multiplayer
	self._server_port = int(server_port)


func is_running() -> bool:
	return self._is_running


func start():
	if !self._is_running:
		print("server_peer: ", server_peer)
		var create_server_result = server_peer.create_server(self._server_port, MAX_PLAYERS)
		if create_server_result != OK:
			OS.alert("Failed to start multiplayer server.")
			return
		else:
			self._multiplayer.multiplayer_peer = server_peer
			self._is_running = true
			print('Started server on port: ', self._server_port)
	else:
		print_debug("Server is already running!")
			
	

func connect_peer_connected(callback: Callable):
	self._multiplayer.peer_connected.connect(callback)
	

func connect_peer_disconnected(callback: Callable):
	self._multiplayer.peer_disconnected.connect(callback)
