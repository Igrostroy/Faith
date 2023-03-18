extends Command
class_name OpenConnectMenuCommand
""" 
Open menu with options for connecting to a game via IP
Usage:
	var main_menu_node = $HBoxContainer/MainMenu
	var connect_menu_node = $HBoxContainer/ConnectMenu
	
	var open_connect_menu_command = OpenConnectMenuCommand.new(
		main_menu_node, battle_options_node,
	)
	open_battle_menu_command.execute()
"""

var _main_menu_node: Node2D = null
var _connect_menu_node: Node2D = null


func _init(main_menu_node: Node2D, connect_menu_node: Node2D):
	self._main_menu_node = main_menu_node
	self._connect_menu_node = connect_menu_node


func execute():
	# Open connect menu
	self._main_menu_node.visible = false
	self._connect_menu_node.visible = true


func undo():
	# Go back to main menu
	self._main_menu_node.visible = true
	self._connect_menu_node.visible = false
