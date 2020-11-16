#!/bin/sh


# For support and/or issues, email brandon.a.valley@boeing.com


# To test in Windows:
# ==================
#     make sure the path to the dir that contains your .sh.exe file is in your environment variables
#  		   if you have already downloaded git, the default location should be:  C:\Users\<USER-NAME>\AppData\Local\Programs\Git\usr\bin\
#     cd into parent directory
#     type "bash" to enter bash console
#     type "./<script_name>"
#     type "exit" to exit bash console



# When / where is this script run:
# ===============================
# All hook scripts execute starting in the repo's root directory (in the same directory that contains .git)
#
# the post-checkout hook runs after the user successfully executes a git checkout

# After you run a successful git checkout, the post-checkout hook runs; you can use it to set up your working
# directory properly for your project environment. This may mean moving in large binary files that you donâ€™t 
# want source controlled, auto-generating documentation, or something along those lines.



# How to use Global Hook Override Files:
# =====================================
# If you are reading this, there is a good chance that you are trying to write a script to interact with Git or doing something weird 
# and this hook is getting in the way. If that is the case, then fear not!  Each main function of this hook script can be individually 
# overridden/disabled for any given repository.  
#
# If there is a main function you would like to override, this can be done by creating 
# a file with a particular name in a particular location.  All override file names and a description of what main function they will 
# disable are listed below.  As for the location, there are a few options:
#
#     1.)  If you only want these global hook functions to be disabled for your local copy of the repository in question:
#
#                   Place the Global Hook Override File(s) in the .git directory.  
#
#     2.)  If you would like to disable certain global hook functions for everyoneâ€™s copy of the repo once they pull, you can place the 
#          Global Hook Override File(s) in either:
#
#	           a.)  The root directory of the repo (in the same directory that contains .git), or 
#              
#              b.)  A directory named â€œGLOBAL_HOOK_OVERRIDE_FILESâ€� in the root directory of the repo, for if you have a few Global Hook 
#                   Override Files and you donâ€™t want to clutter up your repoâ€™s root director  
#
# Obviously, each main function of this file exists for a reason, so please donâ€™t disable anything unless you know what you are doing, 
# and please use the lowest level override possible.  For example, if all you want is to stop the repoâ€™s submodules from automatically
# being updated each time you pull, instead of using "GLOBAL_HOOK_OVERRIDE__POST_MERGEâ€� (which would override everything in the 
# post-merge script), it would be better to use â€œGLOBAL_HOOK_OVERRIDE__UPDATE_SUBMODULESâ€� 
#
#     Global Hook Override Files:
#     --------------------------
#         GLOBAL_HOOK_OVERRIDE__ALL                                            # to override all global hooks
#         
#         GLOBAL_HOOK_OVERRIDE__POST_CHECKOUT                                  # to override this entire file
#         
#         GLOBAL_HOOK_OVERRIDE__DEEP_CLEAN__POST_CHECKOUT                      # to override running "git clean -ffxd" after each checkout



# Main Function Descriptions:
# ==========================
#
#	DEEP_CLEAN__POST_CHECKOUT:
#   -------------------------
#		What it Does:  
#			After the user performs a checkout, if there are any non-ignored untracked files, asks the user if they would like to
#			delete the untracked files, if they select yes, runs "git clean -ffxd"
#
#		What That Means:
#      		git clean - Cleans the working tree by recursively removing files that are not under version control, starting from the
#						current directory.  https://git-scm.com/docs/git-clean
#			With the "-ffxd" options, this effectively means that each time you check out a commit, your repo is fully restored to
#           the point it was at when you made that commit, minus any untracked files.
#				The -ff option (force removal of submodules) is not covered in the above documentation. Here is an explanation:
#				https://mediawiki-commits.wikimedia.narkive.com/SwVzWJKi/gerrit-use-git-clean-ff-instead-of-git-clean-f-force-removal-change-integration-jenkins
#
#       Why This is Needed:
#			There is a bug in SourceTree (Version 3.3.8.3848) that, without this hook, can lead to some very confusing situations. 
#			There are some cases in which untracked files will not appear as uncommitted changes in SourceTree, even though they 
#			will appear in "git status".  One example of this can be seen when dealing with deleted submodules.  If the user makes
#			a new repo, makes a commit, adds a submodule and commits, deletes that submodule then commits, then checks out the 
#			commit where they deleted the submodule, then checks out the original HEAD (the commit where they deleted the submodule),
#			the deleted submodule will still be in the user's repo, but will be untracked and will not appear in SourceTree.  This
#			means the user can end up adding files to their repo just by checking out previous versions and will not be notified in
#           any way.  This hook will notify the user any time there are untracked files in their repo after a checkout, and will 
#			allow for easy deletion if desired.
#
#			Why the popup?  Why not just run "git clean -ffxd" after each checkout?
#				There are cases when this would not be ideal.  For example, if a user has started writing code for a new issue in
#				their repo, and they go to create their first commit, they realize that they are not on the correct feature branch,
#				so they check out the correct branch without staging their changes, oops, looks like the hook script just deleted
# 				all your work.  



#####################################################
#
#     CONSTANTS
#
#####################################################

SCRIPT_PARENT_DIR_PATH="$(dirname "$(readlink -fm "$0")")"
TEMP_FILE_PATH=$SCRIPT_PARENT_DIR_PATH\\temp

# Global Hook Override File Names
GHOFN__ALL="GLOBAL_HOOK_OVERRIDE__ALL"                                             # to override all global hooks
GHOFN__POST_CHECKOUT="GLOBAL_HOOK_OVERRIDE__POST_CHECKOUT"                         # to override this entire file
GHOFN__DEEP_CLEAN__POST_CHECKOUT="GLOBAL_HOOK_OVERRIDE__DEEP_CLEAN__POST_CHECKOUT" # to override running "git clean -ffxd" after each checkout



#####################################################
#
#     FUNCTION DEFINITIONS
#
#####################################################

# given a file name, returns T/F if it exists in:
#                                                  the root dir of the repo, 
#                                                  a dir named GLOBAL_HOOK_OVERRIDE_FILES in the root dir of the repo,
#                                                  the .git dir 
# $1 = file name to check
# 0 = true, 1 = false
function global_hook_override_file_exists(){
    if   test -f ".git/$1"                       ; then return 0 ;
    elif test -f "$1"                            ; then return 0 ;
    elif test -f "GLOBAL_HOOK_OVERRIDE_FILES/$1" ; then return 0 ;
    fi 
    
    return 1
}



# $1 = Global Hook Override File Name
# $2 = command
function if_override_file_not_exist_execute_cmd(){
    if ! global_hook_override_file_exists $1; then
        $2
    fi
}



# $1 = Global Hook Override File Name
# $2 = first command
# $3 = second command
function if_override_file_not_exist_and_length_of_output_of_first_cmd_not_0_execute_second_cmd(){
    if ! global_hook_override_file_exists $1; then
    
        cmd_output=$2
        # echo "cmd_output: $cmd_output"
        
        if [ ${#cmd_output} == 0 ]; then # if the length of $cmd_out == 0 
            echo "cmd_output length not 0!"
            $3
        fi    
    fi
}

git add .

#
#
######################################################
##
##     MAIN
##
######################################################
#
#
#if ! global_hook_override_file_exists $GHOFN__ALL  &&  ! global_hook_override_file_exists $GHOFN__POST_CHECKOUT ; then
#	echo "Executing post-checkout hook script located at: $(readlink -fm "$0")"
#
#    # ===================================
#    #     .DEEP_CLEAN__POST_CHECKOUT                              
#    # =================================== 
#    if ! global_hook_override_file_exists $GHOFN__DEEP_CLEAN__POST_CHECKOUT; then
#
#		# get array of non-ignored untracked files
#		git status -uall --porcelain > $TEMP_FILE_PATH # write the output of the command to the temp file 
#		readarray -t status_uall     < $TEMP_FILE_PATH # read the contents of the temp file into an array (one element per line)
#		rm                             $TEMP_FILE_PATH # delete the temp file
#
#
#		if [ ${#status_uall} != 0 ]; then # if there is at least one untracked file
#			
#			# create string to be used as popup message
#			untracked_files_str = ""
#			
#			for i in "${status_uall[@]}" # for each submodule relative path in $submodule_relative_paths_a
#			do
#				untracked_files_str="$untracked_files_str\n    $i"
#			done
#			
#			# build the message that will appear in the popup message
#			popup_msg_str_header="After prforming this checkout, your repository contains the following untracked files that are not handled by the .gitignore:\n"
#			popup_msg_str_footer="Due to a bug in SourceTree, if these files were not visible as uncommitted changes before this checkout, they will not appear at all and you will be unable to interact with them through Sourcetree.\n\nWould you like to delete all of these files? (git clean -ffxd)"
#			popup_msg_str="$popup_msg_str_header$untracked_files_str\n\n$popup_msg_str_footer"
#			
#			# get user input yes / no from popup
#			user_input=$($SCRIPT_PARENT_DIR_PATH/msg_box.cmd  "$popup_msg_str" 4 "Untracked Files Detected" 2>&1)
#			
#			# if user clicked yes, double check before running git clean - ask again in a new popup
#			if [ $user_input = "6" ]; then
#				# build the message that will appear in the popup message
#				popup_msg_str_header="These files will be permanantly deleted:"
#				popup_msg_str_footer="Are you sure you would like to delete these files?"
#				popup_msg_str="$popup_msg_str_header\n$untracked_files_str\n\n$popup_msg_str_footer"
#				
#				# get user input yes / no from popup
#				user_input=$($SCRIPT_PARENT_DIR_PATH/msg_box.cmd  "$popup_msg_str" 4 "WARNING" 2>&1)
#				
#				# if user clicked yes on 2nd popup, run git clean
#				if [ $user_input = "6" ]; then
#					git clean -ffxd
#				fi
#			fi
#		fi
#    fi
#fi