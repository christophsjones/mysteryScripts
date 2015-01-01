class Unionfind (object):
    """ Simple union-find data structure for equivalence classes """

    def __init__(self, elems=[]):
        self.parents = {x : x for x in elems}
        self.elems = elems
        self.size = len(elems)

    def insert(self, x, y=None):
        """ Insert element x with optional equivalence """
        self.elems.append(x)
        if y:
            self.parents[x] = y
        else:
            self.parents[x] = x
            self.size += 1

    def equiv(self, x, y):
        """ Set x equivalent to y """
        self.parents[x] = y

    def lookup(self, x):
        """ Return a representative of the equivalence class for x """
        path = []
        current = x
        root = self.parents[current]

        while root != current:
            path.append(current)
            current = root
            root = self.parents[root]

        for seen in path:
            self.parents[seen] = root
        return root

    def size(self):
        """ Number of equivalence classes in this map """
        return self.size
