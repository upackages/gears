#!/bin/bash
#
# Copyright (c) 2022 Unately
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

# Default the TZ environment variable to UTC.
TZ=${TZ:-UTC}
export TZ

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Switch to the container's working directory
cd /home/container || exit 1

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')

# Display the command we're running in the output, and then execute it with the env
# from the container itself.
printf "\033[1m\033[33mequestrian@realms~ \033[0m%s\n" "$MODIFIED_STARTUP"

# Run the Server
eval ${MODIFIED_STARTUP}
