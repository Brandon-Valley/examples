# pip install func-timeout
from func_timeout import func_timeout, FunctionTimedOut
 
def print_forever(i):
    while(True):
        print('> ', i)
 
try:
 
    doitReturnValue = func_timeout(3, print_forever, args=('str to print',))
 
except FunctionTimedOut:
 
    print('func time out')
 
except Exception as e:
    raise
 
