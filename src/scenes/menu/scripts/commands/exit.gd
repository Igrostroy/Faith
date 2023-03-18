extends Command
class_name ExitCommand
""" 
Exit from the game. 
Usage:
	var scene_tree: SceneTree = get_tree()
	var exit_command: Command = ExitCommand.new(scene_tree)
	exit_command.execute()
"""


# Scene Tree from where we called this command.
# Required to properly exit from the game.
var _scene_tree: SceneTree = null


func _init(scene_tree: SceneTree):
	self._scene_tree = scene_tree


func execute():
	self._scene_tree.quit()
	

func undo():
	# Do nothing. Exit doesn't implement it 
	pass
