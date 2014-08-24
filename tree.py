class Tree(object):
  """Boring tree class"""

  def __init__(self):
    """Tree is stored as an array. parents[i] is parent of node i"""
    self.parents = []

  def new_node(self, parent):
    """Add node size(Tree) to Tree, hanging off parent"""
    self.parents.append(parent)

  def size(self):
    """size of tree"""
    return len(self.parents)
