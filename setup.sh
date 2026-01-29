#!/bin/sh
set -e

this=$(realpath "$0")

usage() {
    echo "setup.sh [-n NAME] [-s NAMESPACE] [-d DESCRIPTION] [-u URL]

    -n, --name NAME                 Name of the project.
    -s, --namespace NAMESPACE       Name of the project.
    -u, --url URL                   URL of the project.
    -d, --desc DESCRIPTION          Description of the project.

    -y, --yes                       Accept all defaults which were not specified
                                    by other flags.

        --no-vcpkg                  Do not setup vcpkg.

    -h, --help                      Print this message and exit." 1>&2
    exit "$1"
}

check_illegal_chars() {
    val=$1
    chars=$(echo "$2" | sed 's/\[/\\[/g;s/\]/\\]/g;s/\\/\\\\/g')
    echo "$val" | grep -v "[$chars]" -q
}

check_legal_chars() {
    val=$1
    chars=$(echo "$2" | sed 's/\[/\\[/g;s/\]/\\]/g;s/\\/\\\\/g')
    echo "$val" | grep -E "^[$chars]*$" -q
}

get_var() {
    current_val=$1
    default=$2
    prompt=$3
    new_var=$4
    illegal_chars=$5
    legal_chars=$6

    lower_prompt=$(echo "$prompt" | tr "[:upper:]" "[:lower:]")

    [ -n "$current_val" ] && {
        if [ -n "$illegal_chars" ] && ! check_illegal_chars "$current_val" "$illegal_chars"; then
            echo "$prompt cannot contain [$illegal_chars]" 1>&1 && exit 1
        fi
        if [ -n "$legal_chars" ] && ! check_legal_chars "$current_val" "$legal_chars" ; then
            echo "$prompt can only contain [$legal_chars]*" 1>&1 && exit 1
        fi
        return
    }

    if [ -z "$yes" ] && [ -t 0 ] && [ -t 1 ]; then
        echo "Enter the project $lower_prompt, leave empty for default ($default)"
        printf '\x1b[34m%s: \x1b[0m' "$prompt"
        read -r val
        if [ -n "$illegal_chars" ] && ! check_illegal_chars "$val" "$illegal_chars"; then
            echo "$prompt cannot contain [$illegal_chars]" 1>&1 && exit 1
        fi
        if [ -n "$legal_chars" ] && ! check_legal_chars "$val" "$legal_chars" ; then
            echo "$prompt can only contain [$legal_chars]*" 1>&1 && exit 1
        fi
        if [ -n "$val" ]; then
            eval "$new_var=\$val"
        else
            eval "$new_var=\$default"
        fi
        return
    fi
    [ -z "$yes" ] && echo "Warning: using default $prompt $default" 1>&2
    eval "$new_var=\$default"
}

while [ $# -ne 0 ]; do
    case $1 in
        -h|--help)
            usage 0
            ;;
        -n|--name)
            name=$2
            [ -z "$name" ] && usage 1
            shift 2
            ;;
        -s|--namespace)
            namespace=$2
            [ -z "$namespace" ] && usage 1
            shift 2
            ;;
        -u|--url)
            url=$2
            [ -z "$url" ] && usage 1
            shift 2
            ;;
        -d|--desc)
            desc=$2
            [ -z "$desc" ] && usage 1
            shift 2
            ;;
        -y|--yes)
            yes=1
            shift
            ;;
        --no-vcpkg)
            no_vcpkg=1
            shift
            ;;
        *)
            echo "Unexpected argument $1" 1>&2
            usage 1
            ;;
    esac
done


def_name="my_project"
get_var "$name" "$def_name" "Name" name "" "a-z0-9_"

def_namespace=$name
get_var "$namespace" "$def_namespace" "Namespace" namespace "" "a-z0-9_"

def_url="https://github.com/$(git config user.name || echo "$USER")/$name"
get_var "$url" "$def_url" "URL" url " \\\"'" ""

def_desc="My new project"
get_var "$desc" "$def_desc" "Description" desc "" ""

upper_name=$(echo "$name" | tr '[:lower:]' '[:upper:]')
vcpkg_name=$(echo "$name" | tr '_' '-')
for file in $(git ls-files); do :
    [ "$(realpath "$file")" = "$this" ] && continue
    sed -i "s/%%cpp_init_replace%%/$name/g" "$file"
    sed -i "s/%%cpp_init_namespace%%/$namespace/g" "$file"
    sed -i "s/%%CPP_INIT_REPLACE%%/$upper_name/g" "$file"
done
sed -i "s/%%cpp_init_description%%/$desc/g" vcpkg.json
sed -i "s|%%cpp_init_url%%|$url|g" vcpkg.json
sed -i "s|%%cpp_init_vcpkg_name%%|$vcpkg_name|g" vcpkg.json

rm -rf "include/$name"
mv include/cpp_init_replace/ "include/$name"

sed -i "s|https://github.com/dk949/cpp-init/|$url/|g" README.md
sed -i "s/^# init cpp/# \\u$name/g" README.md
sed -i "s/<PROJECT_NAME>/$upper_name/g" README.md
sed -i "s/<project_name>/$name/g" README.md


new_readme=$(awk \
    -vdesc="$desc" \
'
/<!-- CPP_INIT_DESC_START -->/ {
    start_desc=1
    inside_desc=1
}
/<!-- CPP_INIT_SETUP_START -->/ {
    inside_setup=1
}
!inside_desc && !inside_setup{print}
start_desc{
    print desc
    start_desc=0
}
/<!-- CPP_INIT_DESC_END -->/ {
    inside_desc=0
}
/<!-- CPP_INIT_SETUP_END -->/ {
    inside_setup=0
}
' README.md)

echo "$new_readme" > README.md


if [ -z "$no_vcpkg" ]; then
    [ -d './vcpkg/' ] || git clone "https://github.com/Microsoft/vcpkg.git"
    [ -f './vcpkg/vcpkg' ] || ./vcpkg/bootstrap-vcpkg.sh -disableMetrics
    ./vcpkg/vcpkg install
fi

rm "$this"

if [ -t 0 ] && [ -t 1 ]; then
    printf '\n\n\x1b[34m'
    {
        printf IF9fX18gICAgICAgXyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBf
        printf ICAgICAgXyAgICAgICBfIAovIF9fX3wgIF9fX3wgfF8gXyAgIF8gXyBfXyAgICAgX19fIF9fXyAg
        printf XyBfXyBfX18gIF8gX18gfCB8IF9fX3wgfF8gX19ffCB8ClxfX18gXCAvIF8gXCBfX3wgfCB8IHwg
        printf J18gXCAgIC8gX18vIF8gXHwgJ18gYCBfIFx8ICdfIFx8IHwvIF8gXCBfXy8gXyBcIHwKIF9fXykg
        printf fCAgX18vIHxffCB8X3wgfCB8XykgfCB8IChffCAoXykgfCB8IHwgfCB8IHwgfF8pIHwgfCAgX18v
        printf IHx8ICBfXy9ffAp8X19fXy8gXF9fX3xcX198XF9fLF98IC5fXy8gICBcX19fXF9fXy98X3wgfF98
        printf IHxffCAuX18vfF98XF9fX3xcX19cX19fKF8pCiAgICAgICAgICAgICAgICAgICAgIHxffCAgICAg
        printf ICAgICAgICAgICAgICAgICAgICB8X3wgICAgICAgICAgICAgICAgICAgICAK
    } | base64 -d
    printf '\x1b[0m\n'

    echo "*** Configuration ***

    Name        : $name
    Namespace   : $namespace
    URL         : $url
    Description : $desc

"

    printf '\x1b[32mTo restart the setup process, run:
\t\x1b[38;5;250mgit restore .

\x1b[32mTo start new project with these settings, run:
\t\x1b[38;5;250mrm -rf .git && git init && git add . && git commit -m init

\x1b[0m\n'

fi
