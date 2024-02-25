# Execute script on remote machine
ssh -i $PEM_FILE_PATH ubuntu@$EC2_PUBLIC_IP 'bash -s' < my_script.sh



# Or from within script:



# vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
#  Execute the on remote machine
# vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
ssh -i $PEM_FILE_PATH ubuntu@$EC2_PUBLIC_IP 'bash -s' << 'ENDSSH'

...

ENDSSH
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#  Execute the on remote machine
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
