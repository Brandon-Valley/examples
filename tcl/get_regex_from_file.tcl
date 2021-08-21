# #--------------------------------------------------------------------------------------------------#
# # Given path to file, returns list of lines of that file (assuming \n delimiter)
# #
# #   Params:
# #
# #     file_path - Unix path to file to be read
# #       - Do not surround path with ""
# #
# #   Example:
# #
# #       set file_path C:/tools/pic/0246_soc/ip_repo/adxl345_ep/src/hdl/adxl345_ep.vhd
# #       set file_line_l [read_file $file_path]
# #--------------------------------------------------------------------------------------------------#
# proc read_file {file_path} {
#     set fp [open $file_path r]
#     set file_data [read $fp]
#     set file_line_l [split $file_data "\n"]
#     return $file_line_l

#     close $fp
# }


# proc is_substr_in_str {str_to_search substr} {
#     set substring "6-31"
#     if {[string first $substr $str_to_search] != -1} {
#         return "true"
#     } else {
#         return "false"
#     }
# }

# # proc is_substr_in_file {file_path substr} {
# #     set file_line_l [read_file $file_path]
    
# #     foreach line $file_line_l {
# #         if {[is_substr_in_str "$line" $substr]} {
# #             return "true"
# #         }
# #     }

# #     return "false"
# # }

# proc get_regex_from_file {file_path substr} {
#     set file_line_l [read_file $file_path]
    
#     foreach line $file_line_l {
#         # if {[is_substr_in_str "$line" $substr]} {
#         #     return "true"
#         # }

#         set result [regexp {[a-z]+} $sample match]
#         puts "Result: $result match: $match"
#     }

#     return "false"
# }

# set file_path C:/tools/pic/0246_soc/ip_repo/adxl345_ep/src/hdl/adxl345_ep.vhd ; # <------------------ change this to path to your file
# set substr_to_search_for_in_file GPR
# puts [is_substr_in_file $file_path $substr_to_search_for_in_file]

# set substr_to_search_for_in_file GPRsdfsdfsfd
# puts [is_substr_in_file $file_path $substr_to_search_for_in_file]


set sample "ab cd"
set result [regexp {[a-z]+} $sample match]
puts "Result: $result match: $match"