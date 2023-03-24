extends Command
class_name OpenHostMenuCommand
""" 
Open menu with options for hosting a game
Usage:
	var main_menu_node = $HBoxContainer/MainMenu
	var host_menu_node = $HBoxContainer/ConnectMenu
	
	var open_connect_menu_command = OpenConnectMenuCommand.new(
		main_menu_node, host_menu_node,
	)
	open_battle_menu_command.execute()
"""

const HOST_LOBBY_MENU_SCENE = "res://src/scenes/menu/HostLobbyMenu.tscn"
const MAIN_MENU_SCENE = "res://src/scenes/menu/main.tscn"

var _current_scene_tree: SceneTree = null
var _scene_loader: SceneLoader = null


func _init(current_scene_tree: SceneTree):
	self._current_scene_tree = current_scene_tree
	self._scene_loader = SceneLoader.new(self._current_scene_tree)


func execute():
	self._scene_loader.load_scene(HOST_LOBBY_MENU_SCENE)

	
	
	


func undo():
	self._scene_loader.load_scene(MAIN_MENU_SCENE)
