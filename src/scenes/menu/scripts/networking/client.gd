extends Node
class_name MenuNetworkClient

var client_peer = ENetMultiplayerPeer.new()



func connect_to_server(server_ip: String, server_port: int):
	print("client_peer: ", client_peer)
	var connection_result = client_peer.create_client(server_ip, server_port)
	if connection_result != OK:
		OS.alert("Failed to start multiplayer client.")
		return
	else:
		print('Connected to: ', server_ip + ":" + str(server_port))

	
