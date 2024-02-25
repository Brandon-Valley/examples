#!/bin/bash

########################################################################################################################
#  Import variables
########################################################################################################################

SECRET_VAR_FILE_PATH="C:/p/open_emr_setup/secrets/secret_vars.txt"
echo Importing variables from $SECRET_VAR_FILE_PATH ...

# Check if the .env file exists
if [ -f "$SECRET_VAR_FILE_PATH" ]; then
    # Export the variable(s)
    export $(grep -E "^EC2_PUBLIC_IP=" $SECRET_VAR_FILE_PATH | xargs)
else
    echo "$SECRET_VAR_FILE_PATH does not exist."
fi

# Use the SECRET_VAR
echo "Imported $EC2_PUBLIC_IP from $SECRET_VAR_FILE_PATH"

########################################################################################################################
#  Next
########################################################################################################################
