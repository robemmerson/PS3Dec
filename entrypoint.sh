#!/bin/sh

# Function to display available tools
show_tools() {
  echo "Available tools in this container:"
  echo "1. PS3Dec - Tool for decrypting PlayStation 3 software."
  echo "2. unecm - Tool to decode ECM (Error Code Modeler) files."
  echo -e "\n\rDefaulting to PS3Dec...\n\r-----------------------\n\r"
  # Add more tools here as they are included in the container
}

show_tools
PS3Dec