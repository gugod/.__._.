function e {
    local file="$1"

    if [[ ! -f $file ]]; then
        if [[ ${file[0,2]} == "a/" || ${file[0,2]} == "b/" ]]; then
            file=${file[3,$#file]}
        fi
    fi

    if [[ ! -f $file ]]; then
        echo "No such file: $1";
        return;
    fi

    emacsclient -n $file
}
