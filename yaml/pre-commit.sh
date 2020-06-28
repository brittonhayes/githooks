#!/bin/bash

echo "Yaml file pre-commit checker"

# this will retrieve all of the .go files that have been 
# changed since the last commit
STAGED_YAML_FILES=$(git diff --cached --name-only -- '*.yml')

# we can check to see if this is empty
if [[ $STAGED_YAML_FILES == "" ]]; then
    echo "No Shell Files to Update"
# otherwise we can do stuff with these changed go files
else
    for file in $STAGED_YAML_FILES; do
        # format our file
        yamllint $file

        # add any potential changes from our formatting to the 
        # commit
        git add $file
    done
fi
