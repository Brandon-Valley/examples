import argparse

import modelsim_utils

import time

parser = argparse.ArgumentParser()
parser.add_argument('-d', '--do_file_name'               , default = 'run_cmd.do')
parser.add_argument('-r', '--run_to_pane_shift_sleep_sec', default = 4) # 7
parser.add_argument('-t','--true_or_false_flag_example', action='store_true') # true if add flag to cmd line, false if don't
args = parser.parse_args()

time.sleep(1)
modelsim_utils.auto_run(args.do_file_name, int(args.run_to_pane_shift_sleep_sec))
