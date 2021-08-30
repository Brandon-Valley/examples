#--------------------------------------------------------------------------------------------------#
# Given path to file, returns list of lines of that file (assuming \n delimiter)
#
#   Params:
#
#     file_path - Path to file to be read
#       - Do not surround path with ""
#
#   Example:
#
#       set file_path C:/tools/pic/0246_soc/ip_repo/adxl345_ep/src/hdl/adxl345_ep.vhd
#       set file_line_l [read_file $file_path]
#--------------------------------------------------------------------------------------------------#
proc read_file {file_path} {
    set fp [open $file_path r]
    set file_data [read $fp]
    set file_line_l [split $file_data "\n"]

    return $file_line_l

    close $fp
}

#--------------------------------------------------------------------------------------------------#
# Writes a list of lines to a file
#
#   Params:
#
#     file_path - Unix path to file to be read
#       - Do not surround path with ""
#--------------------------------------------------------------------------------------------------#
proc write_file {file_path line_l} {
    set fp [open $file_path w] ; # overwrite

    foreach line $line_l {
        puts $fp $line
    }

    close $fp
}

#--------------------------------------------------------------------------------------------------#
# Prints lists nicely for testing
#--------------------------------------------------------------------------------------------------#
proc puts_list {in_list} {
    puts "{"
    foreach ele $in_list {
        puts "  $ele"
    }
    puts "}"
}

set file_path C:/tools/pic/0246_soc/ip_repo/adxl345_ep/src/hdl/adxl345_ep.vhd
set file_line_l [read_file $file_path]
puts_list $file_line_l