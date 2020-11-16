    import os, sys
    sys.path.insert(1, os.path.join(sys.path[0], '..\\..')) # to import from parent dir
    
    
if __name__ == "__main__": 
    from   usms.file_system_utils import file_system_utils    as fsu
    import                               jsonplus__non_merged as json
else:
    from . usms.file_system_utils import file_system_utils    as fsu
    from . import                        jsonplus__non_merged as json
    
