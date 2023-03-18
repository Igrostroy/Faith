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


var _main_menu_node: Node2D = null
var _host_menu_node: Node2D = null


func _init(main_menu_node: Node2D, host_menu_node: Node2D):
	self._main_menu_node = main_menu_node
	self._host_menu_node = host_menu_node


func execute():
	# Open host menu
	self._main_menu_node.visible = false
	self._host_menu_node.visible = true
	
	
	


func undo():
	# Go back to main menu
	self._main_menu_node.visible = true
	self._host_menu_node.visible = false
