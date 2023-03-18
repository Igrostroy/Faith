extends Node

# This files is a Menu Command Interface.
# In godot each script file serves as a class
class_name Command


# Override this
# @abstractmethod
func execute():
	pass


# Override this
# @abstractmethod
func undo():
	pass
