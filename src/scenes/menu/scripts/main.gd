extends Control



# Globals
@onready var main_menu_node = $HBoxContainer/MainMenu




# ==== ExitCommand ====
@onready var scene_tree: SceneTree = get_tree()
@onready var exit_command: Command = ExitCommand.new(scene_tree)

# ==== OpenHostMenuCommand ==== 
@onready var host_menu_node = $HBoxContainer/HostMenu
@onready var open_host_menu = OpenHostMenuCommand.new(
	main_menu_node, host_menu_node,
)



# ==== OpenConnectMenuCommand ==== 
@onready var connect_menu_node = $HBoxContainer/ConnectMenu
@onready var open_connect_menu = OpenConnectMenuCommand.new(
	main_menu_node, connect_menu_node,
)



# ==== Signal Handlers ====

func _on_exit_button_pressed():
	multiplayer.network_peer = null
	exit_command.execute()


func _on_back_to_main_menu_button_pressed():
	# Enable main menu node and disable host menu node
	open_host_menu.undo()


func _on_connect_button_pressed():
	open_connect_menu.execute()


func _on_back_to_main_menu_from_host_button_pressed():
	# Enable main menu node and disable host menu node
	open_host_menu.undo()


func _on_host_button_pressed():
	open_host_menu.execute()


func _on_back_to_main_menu_from_connect_button_pressed():
	open_connect_menu.undo()


func _on_connect_game_button_pressed():
	open_connect_menu.undo()
	open_host_menu.execute()
	
