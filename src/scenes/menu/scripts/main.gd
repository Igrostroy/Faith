extends Control
class_name GameRoot


# Globals
@onready var main_menu_node = $Level/MainMenu
const CONNECTED_TO_SERVER_SIGNAL = "connected_to_server"
@onready var current_scene_tree = get_tree()


# ==== ExitCommand ====
@onready var scene_tree: SceneTree = get_tree()
@onready var exit_command: Command = ExitCommand.new(scene_tree)

# ==== OpenHostMenuCommand ==== 
@onready var open_host_menu = OpenHostMenuCommand.new(
	current_scene_tree,
)



# ==== OpenConnectMenuCommand ==== 
@onready var connect_menu_node = $Level/ConnectMenu
@onready var open_connect_menu = OpenConnectMenuCommand.new(
	main_menu_node, connect_menu_node,
)



func _ready():
	# Connect custom signals
	self.connect(CONNECTED_TO_SERVER_SIGNAL, _on_connection_to_server_established)



func change_level(scene: PackedScene):
	# Remove old level if any.
	#var level = $Level
	#for child in level.get_children():
	#	level.remove_child(child)
	#	child.queue_free()
	# Add new level.
	#level.add_child(scene.instantiate())
	get_tree().change_scene(scene)




# ==== Signal Handlers ====

func _on_exit_button_pressed():
	exit_command.execute()


func _on_back_to_main_menu_button_pressed():
	# Enable main menu node and disable host menu node
	open_host_menu.undo()


func _on_connect_button_pressed():
	open_connect_menu.execute()


func _on_host_button_pressed():
	open_host_menu.execute()


func _on_back_to_main_menu_from_connect_button_pressed():
	open_connect_menu.undo()


func _on_connection_to_server_established():
	open_connect_menu.undo()
	open_host_menu.execute()
	


func _on_start_game_pressed():
	var next_level = preload("res://src/scenes/level/BattleLevel.tscn")
	change_level(next_level)
