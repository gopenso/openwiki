#!/bin/bash

# Ask for the project name
read -p "Enter the project name (e.g., 'gopenso/amical' or 'dominance'): " project_name

# Convert "/" to "_" for the database filename
db_filename="${project_name//\//_}"

# Remove the database file
echo "Removing database file: ~/.adalflow/databases/${db_filename}.pkl"
sudo rm ~/.adalflow/databases/${db_filename}.pkl

# Determine if it's a local or remote repository
if [[ "$project_name" == *"/"* ]]; then
    # Remote repository (contains "/")
    # Extract org and repo from "org/repo" format
    org="${project_name%/*}"
    repo="${project_name##*/}"
    wiki_filename="deepwiki_cache_github_${org}_${repo}_zh-tw.json"
else
    # Local repository (no "/")
    wiki_filename="deepwiki_cache_local_local_${project_name}_zh-tw.json"
fi

# Remove the wikicache file
echo "Removing wikicache file: ~/.adaflow/wikicache/${wiki_filename}"
sudo rm ~/.adalflow/wikicache/${wiki_filename}

echo "Done!"
