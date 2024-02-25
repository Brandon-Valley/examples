# Transfer file from remote machine to local machine
scp -i <LOCAL_PEM_FILE_PATH> ubuntu@<PUBLIC_IP>:/etc/php/8.1/cli/php.ini <LOCAL_DIST_DIR_PATH>

# Transfer file from local machine to remote machine
scp -i <LOCAL_PEM_FILE_PATH> <LOCAL_FILE_PATH> ubuntu@<PUBLIC_IP>:/etc/php/8.1/cli/
