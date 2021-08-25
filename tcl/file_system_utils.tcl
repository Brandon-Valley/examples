set SCRIPT_PARENT_DIR_PATH [ file dirname [ file normalize [ info script ] ] ] ; # parent dir of this script

proc delete_if_exists {fs_obj_path} {
    if {[file exists $fs_obj_path]} {
        file delete -force $fs_obj_path
    }
}


proc copy_obj_to_dest {obj_path dest_path} {
    set obj_tail [file tail $obj_path]
    set new_obj_path $dest_path/$obj_tail
    file copy -force $obj_path $new_obj_path
}


#--------------------------------------------------------------------------------------------------#
# get_dir_content_l
#
#   Description
#
#   - Returns list of paths, names, etc based on params
#   - Will not throw error/will return empty list if no items found
#
#   Parameters:
#
#     obj_type:  Type of object to return
#       - "all"
#       - "dir"
#       - "file"
#
#     content_type:  Type of content to return, options below:
#       - "abs_path"
#       - "name"      - not yet implemented
#       - "rel_path"  - not yet implemented
#
#     pattern:  Search pattern under dir_path
#       - Usually just for obj_type == "file", usually just leave default for "dir"
#       - EXAMPLE: Want all/only .bd files - pattern: ".bd"
#       - EXAMPLE: Want all/only .bd and .txt files - pattern: "{*.bd,*.txt}"
#--------------------------------------------------------------------------------------------------#
proc get_dir_content_l {dir_path {obj_type "all"} {content_type "abs_path"} {pattern "*"} {recursive "false"} {rel_to_path "none"}} {

    # get content from nested dirs if recurse needed
    set recursed_dirs_content_l {} ; # content of all child dirs of this dir (dir_path)

    if {$recursive == "true"} {
        set child_dir_path_l [get_dir_content_l $dir_path "dir" "abs_path" "*" "false"]
        # puts_list $child_dir_path_l

        foreach child_dir_path $child_dir_path_l {
            set child_dir_recursed_content_l [get_dir_content_l $child_dir_path $obj_type $content_type $pattern $recursive $rel_to_path]
            set recursed_dirs_content_l [concat $recursed_dirs_content_l $child_dir_recursed_content_l]
        }
    }

    # get content of just this dir (in_dir)
    set dir_content_l {}
    if {$obj_type == "dir"} {
        set dir_content_l [glob -nocomplain -directory $dir_path -type d $pattern]

    } elseif {$obj_type == "file"} {
        set dir_content_l [glob -nocomplain -directory $dir_path -type f $pattern]

    } elseif {$obj_type == "all"} {
        set dir_content_l [glob -nocomplain -directory $dir_path -types {d f} $pattern]

    } else {
        puts "ERROR: Invalid value given for obj_type: $obj_type"
        exit
    }

    # return full content list
    return [concat $dir_content_l $recursed_dirs_content_l]
}