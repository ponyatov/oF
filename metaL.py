import os, sys

class Object:
    def __init__(self, V):
        self.value = V

class IO(Object):
    def __init__(self, V):
        super().__init__(V)
        self.path = V

class Dir(IO):
    def sync(self):
        try: os.mkdir(self.path)
        except FileExistsError: pass

class File(IO): pass

class Meta(Object): pass

class Project(Meta):
    def __init__(self, V=None):
        if not V: V = os.getcwd()[-1]
        super().__init__(V)
        self.d = Dir(V)

    def sync(self):
        self.d.sync()
