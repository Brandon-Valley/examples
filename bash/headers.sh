
# dynamic header with a border that adjusts to the length of the text
header="Executing Step #1"
len=${#header}
total_len=$((len+4))

printf "\n\n"
printf "%0.s#" $(seq 1 $total_len)
printf "\n# %s #\n" "$header"
printf "%0.s#" $(seq 1 $total_len)
printf "\n\n"

# you can add more decoration and color to the text. Here's an example:
header="Executing Step #1"
len=${#header}
total_len=$((len+4))

printf "\n\n\e[1;33m" # Yellow color
printf "%0.s#" $(seq 1 $total_len)
printf "\n# \e[1;32m%s \e[1;33m#\n" "$header" # Green color for the header
printf "%0.s#" $(seq 1 $total_len)
printf "\e[0m\n\n" # Reset color

header="Executing Step #1"
len=${#header}
total_len=$((len+8))

# adding more characters and lines to make the header stand out more.
printf "\n\n\e[1;33m" # Yellow color
printf "%0.s#" $(seq 1 $total_len)
printf "\n### \e[1;32m%s \e[1;33m###\n" "$header" # Green color for the header
printf "%0.s#" $(seq 1 $total_len)
printf "\e[0m\n\n" # Reset color

# Fancy
header="Executing Step #1"
len=${#header}
total_len=$((len+12))

printf "\n\n\e[1;33m" # Yellow color
printf "%0.s*" $(seq 1 $total_len)
printf "\n****** \e[1;32m%s \e[1;33m******\n" "$header" # Green color for the header
printf "%0.s*" $(seq 1 $total_len)
printf "\e[0m\n\n" # Reset color
