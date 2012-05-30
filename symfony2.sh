#!/bin/bash

# Expand globs to null when there are no matches
shopt -s nullglob

# Look for either a '<subdir>/console' or a 'symfony' file
until
        file=(*/console symfony); [[ -f "$file" ]] && php "$file" "$@" && exit;
do
        [[ "$PWD" == "/" ]] && break;
        cd ..
done

echo 'No Symfony file could be found!'
