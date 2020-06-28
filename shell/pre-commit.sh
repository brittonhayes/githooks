#!/bin/bash

echo "Shell script pre-commit checker"

# this will retrieve all of the .go files that have been 
# changed since the last commit
STAGED_SHELL_FILES=$(git diff --cached --name-only -- '*.sh')

# we can check to see if this is empty
if [[ $STAGED_SHELL_FILES == "" ]]; then
    echo "No Shell Files to Update"
# otherwise we can do stuff with these changed go files
else
    for file in $STAGED_SHELL_FILES; do
        # format our file
        shellcheck $file

        # add any potential changes from our formatting to the 
        # commit
        git add $file
    done
fi
