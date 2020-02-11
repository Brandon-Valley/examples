''' [======- - - - -=================- All Utilities Standard -=================- - - - -======] '''
# to allow for relative imports
import sys, os
sys.path.insert(1, os.path.join(sys.path[0], os.path.dirname(os.path.abspath(__file__))))
''' [======- - - - - - -=============- - - - -========- - - - -=============- - - - - - -======] '''




# always run as if run from this file - top level
# sets cwd, useful for being able to call this file
# in the "__main__" of a nested file for testing
import os
os.chdir(os.path.dirname(os.path.abspath(__file__)))
