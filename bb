#!/bin/bash
#
# Author: Dinh Van Hung
# bb.sh
#
# Description:
#
# `bb` command
# `bb` command helpful for web developers control their projects to be more easy.
# The developers need only remember abc command to process multiple complex program.
#
# Usage:
# using this command to see helful guides
# bb -h|--help
#
# Special thanks to:
# Tasos Latsas: https://github.com/tlatsas/bash-spinner
# And Stackoverflow's members
#


# GLOBAL VARIABLE DEFINE
NAMESCRIPT="bb"
AUTHOR="Dinh Van Hung"
EMAIL="dinhhungvn@gmail.com"
WEBSITE="https://www.dinhvanhung.me"

# Source all files in library
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
for f in $DIR/lib/*; do
  source "$f"
done

# Degine usage string
read -d '' usage <<- EOF
Usage:  bb [OPTIONS] COMMAND [arg...]
        bb [ -h |--help | -v | --version ]

Options:
        -h, --help        Print usage
        -v, --version     Print curent version
Command:
        start     Start install all need packages

Run 'bb COMMAND -h|--help' for more information on a command.
EOF

case $1 in
  start)
    "$1" $@
  ;;
  -v|--version)
    echo "${NAMESCRIPT} version is $VER"
  ;;

  -h|--help|*)
    echo "$usage"
  ;;
esac
