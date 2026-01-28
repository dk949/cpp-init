#!/bin/sh
this=$(realpath "$0")
name=this_is_a_new_name
upper_name=$(echo "$name" | tr '[:lower:]' '[:upper:]')
desc="This is a description"
url=https://github.com/dk949/$name
for file in $(git ls-files); do :
    [ "$(realpath "$file")" = "$this" ] && continue
    sed -i "s/%%cpp_init_replace%%/$name/g" "$file"
    sed -i "s/%%CPP_INIT_REPLACE%%/$upper_name/g" "$file"
done
sed -i "s/%%cpp_init_description%%/$desc/g" vcpkg.json
sed -i "s|%%cpp_init_url%%|$url|g" vcpkg.json
