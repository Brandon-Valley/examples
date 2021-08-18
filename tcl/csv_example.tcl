package require csv

#--------------------------------------------------------------------------------------------------#
# Writes to csv file
#   Params:
#
#     row_ll - List of row_lists
#
#     csv_path - Unix path to csv file to be written
#       - Do not surround path with ""
#       - File does not have to exist before running
#       - Will throw perm. error if you have the csv file open in excel
#
#   Example:
#
#     package require csv
#     set row_ll {}
#     lappend row_ll {Name Addr}
#     lappend row_ll {bobby 0x123 "hi there, how are you?"}
#     lappend row_ll {joe 0x456}
#     write_csv $row_ll C:/tools/tmp/test_csv.csv
#
#   Running the above example code will create a .csv file that looks like:
#
#     Name  | Addr  |
#     bobby | 0x123 | "hi there, how are you?"
#     joe   | 0x456 |


#--------------------------------------------------------------------------------------------------#
proc write_csv {row_ll csv_path} {
    # Write the data to a file
    set f [open $csv_path w]
    puts $f [csv::joinlist $row_ll]
    close $f
}

set row_ll {}
lappend row_ll {Name Addr}
lappend row_ll {bobby 0x123 "hi there, how are you?"}
lappend row_ll {joe 0x456}
write_csv $row_ll C:/tools/tmp/test_csv.csv

