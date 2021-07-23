import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-a', '--arg_0', default = 'FAIL - arg not passed')
args = parser.parse_args()

print(args.arg_0)