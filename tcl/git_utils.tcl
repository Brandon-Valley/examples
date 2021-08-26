# HOW TO SOURCE THIS FILE:
# ------------------------
# # source git_utils.tcl
# set SCRIPT_PARENT_DIR_PATH [file normalize [file dirname [info script]]] ; # get path to parent dir of this file
# set git_utils_file_path [file normalize $SCRIPT_PARENT_DIR_PATH/<PATH_TO_UTIL_FILE_RELATIVE_TO_FILE_YOU_ARE_SOURCING_IT_FROM>]  ; # get path to utility file
# source $git_utils_file_path ;

proc is_dir_path_git_repo {dir_path} {
    if {[catch {
        exec git rev-parse --is-inside-work-tree -C $dir_path
    } result]} {
        # Handle the error, $result is unused b/c it would only give the msg
        # puts "    ERROR CAUGHT,  Probably meaning that dir_path is not a git repo, returning false...  \n\ndir_path:  $dir_path\n\n    $::errorInfo\n"
        return "false"
    } else {
        # Use the result
        return "true"
    }
}

proc get_abrv_hash_of_head_commit {repo_root_dir_path} {
    set cmd "exec git -C $repo_root_dir_path log --pretty=format:%h -n 1"
    # puts $cmd

    set abrv_commit_hash [eval $cmd]
    return $abrv_commit_hash
}

# returns empty list if no tags
# bug: will only return 1 tag if there are multiple tags on the same commit
proc get_tag_l_of_commit_if_any {repo_root_dir_path commit_hash} {
    if {[catch {
        set cmd "exec git -C $repo_root_dir_path describe --exact-match $commit_hash"
        # puts $cmd
        set cmd_result [eval $cmd]
    } result]} {
        # Handle the error, $result is unused b/c it would only give the msg
        # puts "No tag found, moving on - ::errorInfo:  \n\n$repo_root_dir_path\n\n    $::errorInfo\n"
        return {}
    } else {
        # Use the result
        return $cmd_result
    }
}

proc uncommitted_changes_in_repo {repo_root_dir_path} {
        set cmd "exec git -C $repo_root_dir_path status --porcelain"
        # puts "    running cmd: $cmd"
        set cmd_result [eval $cmd]
        # puts "    cmd result: $cmd_result"

        if {"$cmd_result" == ""} {
            return "false"
        } else {
            return "true"
        }
        return cmd_result
}
